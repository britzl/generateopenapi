#!/usr/bin/env python

import os
import sys
import shutil
import json
import re
import html
import codecs
import fnmatch
import pystache
import urllib.parse

TAG_RE = re.compile(r'(<!--.*?-->|<[^>]*>)')
PRIMITIVE_TYPES = [ "integer", "number", "string", "boolean"]

# https://stackoverflow.com/a/19730306
def striphtml(s):
    # Remove well-formed tags, fixing mistakes by legitimate users
    no_tags = TAG_RE.sub('', s)
    return no_tags
    # # Clean up anything else by escaping
    # ready_for_web = html.escape(no_tags)
    # return ready_for_web

def is_primitive_type(t):
    return t in PRIMITIVE_TYPES

def is_primitive_python_type(o):
    return isinstance(o, str) or isinstance(o, bool) or isinstance(o, int) or isinstance(o, float) or o is None

def python_to_lua_type(o):
    if isinstance(o, str):
        return "\"" + o + "\""
    elif isinstance(o, bool):
        return ("true" if o else "false")
    elif isinstance(o, int) or isinstance(o, float):
        return str(o)
    elif o is None:
        return "nil"
    else:
        return {}

def tolua(o, prefix = "-- ", suffix = ""):
    s = ""
    if isinstance(o, list):
        s = s + prefix + "{\n"
        for v in o:
            s = s + tolua(v, prefix + "  ", ",")
        s = s + prefix + "}" + suffix + "\n"
    elif isinstance(o, dict):
        s = s + prefix + "{\n"
        for k in o:
            v = o[k]
            if is_primitive_python_type(v):
                s = s + prefix + "  " + k + " = " + tolua(v, "", ",")
            else:
                s = s + prefix + "  " + k + " = \n" + tolua(v, prefix + "  ", ",")
        s = s + prefix + "}" + suffix + "\n"
    else:
        s = s + prefix + python_to_lua_type(o) + suffix + "\n"
    return s

def capitalize(s):
    if len(s) == 0: return s
    return s[0].upper() + s[1:]

def render(data, templatefile, outfile, unquote = True):
    print(f"Rendering {outfile}")
    with open(templatefile, 'r') as f:
        template = f.read()
        result = pystache.render(template, data)
        if unquote:
            result = urllib.parse.unquote(result)
        with codecs.open(outfile, "wb", encoding="utf-8") as f:
            f.write(result)

def cleanstring_common(s):
    s = s.replace(": ", " ") # a colon in a description will mess with the yaml
    s = striphtml(s)
    return s

def cleanstring_singleline(s):
    s = s.strip()
    s = s.replace("\n", ". ")
    s = s.replace("<br>", ". ")
    s = cleanstring_common(s)
    return s

def cleanstring_multiline(s, linebreak = "\n-- "):
    s = s.strip()
    s = s.replace("\n", linebreak)
    s = s.replace("<br><br>", linebreak)
    s = s.replace("<br> ", linebreak)
    s = s.replace("<br>", linebreak)
    s = cleanstring_common(s)
    return s

def load_api(path):
    print(f"Loading {path}")
    with open(path, "r", encoding='utf-8') as f:
        api = json.load(f)
        return api

def expand_array(arr, api):
    assert arr["type"] == "array"
    if "items" in arr:
        expand(arr["items"], api)

def expand_object(obj, api):
    assert obj["type"] == "object"
    if "properties" in obj:
        properties = obj["properties"]
        if isinstance(properties, dict):
            obj["properties"] = []
            for prop_id in properties:
                prop = properties[prop_id]
                prop["id"] = prop_id
                obj["properties"].append(prop)

        for prop in obj["properties"]:
            expand(prop, api)
            prop["description"] = cleanstring_multiline(prop.get("description", ""))

def expand(v, api):
    if "expanded" in v:
        return
    v["expanded"] = True
    if "oneOf" in v:
        v["type"] = "oneof"
        v["isoneof"] = True
        for o in v["oneOf"]:
            expand(o, api)
    elif "allOf" in v:
        v["type"] = "allof"
        v["isallof"] = True
        for o in v["allOf"]:
            expand(o, api)
    elif v["type"] == "object":
        v["isobject"] = True
        expand_object(v, api)
        if v.get("properties"):
            v["hasproperties"] = True
    elif v["type"] == "array":
        v["isarray"] = True
        expand_array(v, api)
    elif not is_primitive_type(v["type"]):
        error("Unable to expand", v["type"])

def property_to_example(prop, api, cache = {}):
    # avoid cyclic references by only including a property once
    prop_id = prop.get("id")
    if prop_id:
        if prop_id in cache:
            return None
        cache[prop_id] = True

    example = None
    if prop["type"] == "string":
        example = prop.get("example", prop.get("description", ""))
    elif prop["type"] == "boolean":
        example = prop.get("example", True)
    elif prop["type"] == "number":
        example = prop.get("example", 123.456)
    elif prop["type"] == "integer":
        example = prop.get("example", 123)
    elif prop["type"] == "oneof":
        example = property_to_example(prop["oneOf"][0], api, cache)
    elif prop["type"] == "array":
        example = []
        example.append(property_to_example(prop["items"], api, cache))
    elif prop["type"] == "object":
        example = {}
        properties = prop.get("properties", {})
        if isinstance(properties, list):
            for p in properties:
                example[p["id"]] = property_to_example(p, api, cache)
        else:
            for prop_id in properties:
                p = prop["properties"][prop_id]
                example[prop_id] = property_to_example(p, api, cache)
    else:
        print("Unknown type", prop["type"])
        sys.exit(4)
    return example

def process_paths(api):
    print("processing paths")
    # merge paths+methods and convert into list
    paths = api["paths"]
    api["paths"] = []
    for path in paths:
        for method in paths[path]:
            data = paths[path][method]
            if data.get("x-admin") or data.get("x-server"):
                continue
            data["method"] = method.upper()
            data["path"] = path
            print("  ", data["path"], data["method"])
            data["description"] = cleanstring_multiline(data.get("description", ""))
            data["operationId"] = data["operationId"].replace("-", "_")
            api["paths"].append(data)

    # convert security schemes
    # https://swagger.io/docs/specification/v3_0/authentication/#describing-security
    for data in api["paths"]:
        security = []
        for scheme in data.get("security", {}):
            for scheme_id in scheme:
                security.append({
                    scheme_id: True,
                    "scheme": scheme_id,
                    "description": cleanstring_multiline(api["components"]["securitySchemes"][scheme_id]["description"])
                })
        data["security"] = security

    # convert response codes to list
    # https://swagger.io/docs/specification/v3_0/describing-responses/
    print("converting response codes")
    for data in api["paths"]:
        print("   ", data["path"])
        responses = data["responses"]
        data["responses"] = []
        for code in responses:
            response = responses[code]
            response["code"] = code
            data["responses"].append(response)

    # processing parameters
    # https://swagger.io/docs/specification/v3_0/describing-parameters/
    print("expanding parameters")
    for data in api["paths"]:
        print("   ", data["path"])
        for parameter in data.get("parameters", []):
            parameter["inpath"] = parameter.get("in") == "path"
            parameter["inquery"] = parameter.get("in") == "query"
            parameter["name"] = parameter["name"].replace("[]", "")
            parameter["name"] = parameter["name"].replace("-", "_")
            parameter["description"] = cleanstring_singleline(parameter.get("description", ""))

    # create requestBody example
    # https://swagger.io/docs/specification/v3_0/describing-request-body/describing-request-body/
    # https://swagger.io/docs/specification/v3_0/adding-examples/
    for data in api["paths"]:
        if "requestBody" in data:
            for media_type in data["requestBody"]["content"]:
                schema = data["requestBody"]["content"][media_type]["schema"]
                if media_type == "application/json":
                    if "example" not in schema:
                        schema["example"] = property_to_example(schema, api, cache = {})
                    data["requestBodyLuaExample"] = tolua(schema["example"], "-- ", "\n").strip()
                    data["requestBodyYamlExample"] = urllib.parse.quote(tolua(schema["example"], "              ", "\n").strip())


def find_keys(key_to_find, d, parent_value = None, parent_key = None):
    if isinstance(d, dict):
        for key, value in d.items():
            if key_to_find == key:
                yield (parent_value,parent_key)
            if isinstance(value, dict) or isinstance(value, list):
                yield from find_keys(key_to_find, value, parent_value = d, parent_key = key)
    elif isinstance(d, list):
        for i in range(len(d)):
            value = d[i]
            if isinstance(value, dict):
                yield from find_keys(key_to_find, value, parent_value = d, parent_key = i)


def expand_ref(ref, api):
    # https://swagger.io/docs/specification/v3_0/using-ref/
    if not ref.startswith("#/"):
        print(f"Only local references are support. Found '{ref}'")
        return None

    ref = ref.replace("#/", "")
    splits = ref.split("/")

    element = api
    for s in splits:
        element = element[s]

    element_id = splits[len(splits) - 1]
    element["id"] = element_id.replace("-", "_").lower()
    return element

def expand_components(api):
    print("expand components")
    for entry in find_keys("$ref", api["components"]):
        container = entry[0]
        key = entry[1]
        container[key] = expand_ref(container[key]["$ref"], api)

def expand_paths(api):
    print("expand paths")
    for entry in find_keys("$ref", api["paths"]):
        container = entry[0]
        key = entry[1]
        container[key] = expand_ref(container[key]["$ref"], api)


def run():
    if len(sys.argv) != 6:
        print("Syntax: generate.py name openapi.json api.mtl script_api.mtl out")
        exit(1)

    module_name = sys.argv[1]
    api_json = sys.argv[2]
    if not api_json.endswith(".json"):
        print("Argument two must be a .json file")
        exit(1)
    api_template = sys.argv[3]
    if not api_template.endswith(".mtl"):
        print("Argument three must be a .mtl file")
        exit(1)
    script_api_template = sys.argv[4]
    if not script_api_template.endswith(".mtl"):
        print("Argument two must be a .mtl file")
        exit(1)
    out_dir = sys.argv[5]
    if not os.path.exists(out_dir):
        print(f"Output directory {out_dir} does not exist")
        exit(1)

    api = load_api(api_json)
    api["info"]["name"] = module_name

    expand_components(api)
    expand_paths(api)
    process_paths(api)

    # with open("apidump.json", 'w') as f:
    #     f.write(json.dumps(api, indent = 2))

    render(api, api_template, f"./{out_dir}/{module_name}.lua")
    render(api, script_api_template, f"./{out_dir}/api/{module_name}.script_api")


if __name__ == '__main__':
    run()