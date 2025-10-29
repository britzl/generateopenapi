local M = {}

local SERVERS = {
    "https://defold.cloud.namazustudios.com/api/rest",
}


--- 
-- Upload Apple IAP Receipt. Returns a list of RewardIssuances, which may contain already-redeemed issuances.
-- @path /ios/receipt
-- @name uploadAppleIapReceipt
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.uploadAppleIapReceipt(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/ios/receipt"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Searches application profiles
-- Searches all instances of ApplicationProfiles associated with  the application.  The search query may be a full text search.
-- @path /application/{applicationNameOrId}/configuration
-- @name getApplicationProfiles
-- @param applicationNameOrId (REQUIRED) 
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getApplicationProfiles(applicationNameOrId, offset, count, search, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Applications
-- Performs a full-text search of all applications known to the server.  As with other full-text endpoints this allows for pagination and offset.
-- @path /application
-- @name getApplications
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getApplications(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/application"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a New Application
-- Gets the metadata for a single application.  This may include more specific details not available in the bulk-get or fetch operation.
-- @path /application
-- @name createApplication
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createApplication(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/application"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get an Application
-- Gets the metadata for a single application.  This may include more specific details not available in the bulk-get or fetch operation.
-- @path /application/{nameOrId}
-- @name getApplication
-- @param nameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getApplication(nameOrId, callback, retry_policy, cancellation_token)
    assert(nameOrId)

    local url_path = "/application/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an Application
-- Performs an update to an existing application known to the server.
-- @path /application/{nameOrId}
-- @name updateApplication
-- @param nameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateApplication(nameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(nameOrId)

    local url_path = "/application/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes an Application
-- Deletes a specific application known to the server.
-- @path /application/{nameOrId}
-- @name deleteApplication
-- @param nameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteApplication(nameOrId, callback, retry_policy, cancellation_token)
    assert(nameOrId)

    local url_path = "/application/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Facebook ApplicationConfiguration
-- Creates a new Facebook ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/facebook
-- @name createFacebookApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createFacebookApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/facebook"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Facebook Application Configuration
-- Gets a single Facebook application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}
-- @name getFacebookApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFacebookApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Facebook ApplicationConfiguration
-- Updates an existing Facebook Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}
-- @name updateFacebookApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateFacebookApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Facebook ApplicationConfiguration
-- Deletes an existing Facebook Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}
-- @name deleteFacebookApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteFacebookApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/facebook/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Firebase ApplicationConfiguration
-- Creates a new Firebase ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/firebase
-- @name createFirebaseApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createFirebaseApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/firebase"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Firebase Application Configuration
-- Gets a single Firebase application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}
-- @name getFirebaseApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFirebaseApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Firebase ApplicationConfiguration
-- Updates an existing Firebase Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}
-- @name updateFirebaseApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateFirebaseApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Firebase ApplicationConfiguration
-- Deletes an existing Firebase Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}
-- @name deleteFirebaseApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteFirebaseApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/firebase/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Google Play ApplicationConfiguration
-- Creates a new GooglePlay ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/google_play
-- @name createGooglePlayApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createGooglePlayApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/google_play"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Google Play Application Configuration
-- Gets a single Google Play application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}
-- @name getGooglePlayApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getGooglePlayApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Google Play ApplicationConfiguration
-- Updates an existing Google Play Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}
-- @name updateGooglePlayApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateGooglePlayApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Google Play ApplicationConfiguration
-- Deletes an existing Google Play Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}
-- @name deleteGooglePlayApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteGooglePlayApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates the ProductBundle
-- Updates the ProductBundle for the given ApplicationConfiguration
-- @path /application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}/product_bundles
-- @name updateProductBundleForApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateProductBundleForApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/google_play/{applicationConfigurationNameOrId}/product_bundles"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new iOS ApplicationConfiguration
-- Creates a new iOS ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/ios
-- @name createIosApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createIosApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/ios"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a iOS Application Configuration
-- Gets a single iOS application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}
-- @name getIosApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getIosApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a iOS ApplicationConfiguration
-- Updates an existing iOS Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}
-- @name updateIosApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateIosApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a iOS ApplicationConfiguration
-- Deletes an existing iOS Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}
-- @name deleteIosApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteIosApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates the ProductBundle
-- Updates the ProductBundle for the given ApplicationConfiguration
-- @path /application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}/product_bundles
-- @name updateProductBundleForApplicationConfiguration_1
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateProductBundleForApplicationConfiguration_1(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/ios/{applicationConfigurationNameOrId}/product_bundles"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new iOS ApplicationConfiguration
-- Creates a new iOS ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/matchmaking
-- @name createMatchmakingApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMatchmakingApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/matchmaking"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a iOS Application Configuration
-- Gets a single iOS application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}
-- @name getMatchmakingApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatchmakingApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a iOS ApplicationConfiguration
-- Updates an existing iOS Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}
-- @name updateMatchmakingApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateMatchmakingApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a iOS ApplicationConfiguration
-- Deletes an existing iOS Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}
-- @name deleteMatchmakingApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMatchmakingApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/matchmaking/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new PSN ApplicationConfiguration
-- Creates a new PSN ApplicationConfiguration with the specific ID or application.
-- @path /application/{applicationNameOrId}/configuration/psn
-- @name createPSNApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createPSNApplicationConfiguration(applicationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/psn"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a PSN Application Configuration
-- Gets a single PSN application based on unique name or ID.
-- @path /application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}
-- @name getPSNApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getPSNApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a PSN ApplicationConfiguration
-- Updates an existing PSN Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}
-- @name updatePSNApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updatePSNApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a PSN ApplicationConfiguration
-- Deletes an existing PSN Application profile if it is known to the server.
-- @path /application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}
-- @name deletePSNApplicationConfiguration
-- @param applicationNameOrId (REQUIRED) 
-- @param applicationConfigurationNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deletePSNApplicationConfiguration(applicationNameOrId, applicationConfigurationNameOrId, callback, retry_policy, cancellation_token)
    assert(applicationNameOrId)
    assert(applicationConfigurationNameOrId)

    local url_path = "/application/{applicationNameOrId}/configuration/psn/{applicationConfigurationNameOrId}"
    url_path = url_path:gsub("{applicationNameOrId}", uri.encode(tostring(applicationNameOrId)))
    url_path = url_path:gsub("{applicationConfigurationNameOrId}", uri.encode(tostring(applicationConfigurationNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Lists all auth schemes in the system
-- Requires SUPERUSER access. Gets a pagination of Auth Schemes for the given query.
-- @path /auth_scheme/custom
-- @name getAuthSchemes
-- @param offset 
-- @param count 
-- @param tags 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthSchemes(offset, count, tags, callback, retry_policy, cancellation_token)

    local url_path = "/auth_scheme/custom"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Auth Scheme
-- Creates a new Auth Scheme, from the data in the given auth scheme request
-- @path /auth_scheme/custom
-- @name createAuthScheme
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createAuthScheme(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/auth_scheme/custom"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Auth Scheme
-- Gets a specific Auth Scheme by the authSchemeId.
-- @path /auth_scheme/custom/{authSchemeId}
-- @name getAuthScheme
-- @param authSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthScheme(authSchemeId, callback, retry_policy, cancellation_token)
    assert(authSchemeId)

    local url_path = "/auth_scheme/custom/{authSchemeId}"
    url_path = url_path:gsub("{authSchemeId}", uri.encode(tostring(authSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an Auth Scheme
-- Updates an Auth Scheme with the specified data in the auth scheme request.
-- @path /auth_scheme/custom/{authSchemeId}
-- @name updateAuthScheme
-- @param authSchemeId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateAuthScheme(authSchemeId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(authSchemeId)

    local url_path = "/auth_scheme/custom/{authSchemeId}"
    url_path = url_path:gsub("{authSchemeId}", uri.encode(tostring(authSchemeId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes an Auth Scheme
-- Deletes an Auth Scheme with the specified id.
-- @path /auth_scheme/custom/{authSchemeId}
-- @name deleteAuthScheme
-- @param authSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteAuthScheme(authSchemeId, callback, retry_policy, cancellation_token)
    assert(authSchemeId)

    local url_path = "/auth_scheme/custom/{authSchemeId}"
    url_path = url_path:gsub("{authSchemeId}", uri.encode(tostring(authSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Session using OAuth2
-- Begins a session by accepting a session request with parameters matching the specified OAuth2 Scheme. Upon successful validation against the scheme provided in the path, this will return a Session which can be used for authentication. If there is no User associated with the supplied credentials, this will implicitly create a new account and will include that account information in the response. If there is an account, or this method receives an existing session key, this will link to the existing scheme if the account was not previously linked.
-- @path /auth/oauth2
-- @name createOAuth2Session
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createOAuth2Session(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/auth/oauth2"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Lists all auth schemes in the system
-- Requires SUPERUSER access. Gets a pagination of Auth Schemes for the given query.
-- @path /auth_scheme/oauth2
-- @name getAuthSchemes_1
-- @param offset 
-- @param count 
-- @param tags 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthSchemes_1(offset, count, tags, callback, retry_policy, cancellation_token)

    local url_path = "/auth_scheme/oauth2"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Auth Scheme
-- Creates a new Auth Scheme, from the data in the given auth scheme request
-- @path /auth_scheme/oauth2
-- @name createAuthScheme_1
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createAuthScheme_1(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/auth_scheme/oauth2"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Auth Scheme
-- Gets a specific Auth Scheme by the oAuth2AuthSchemeId.
-- @path /auth_scheme/oauth2/{oAuth2AuthSchemeId}
-- @name getAuthScheme_1
-- @param oAuth2AuthSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthScheme_1(oAuth2AuthSchemeId, callback, retry_policy, cancellation_token)
    assert(oAuth2AuthSchemeId)

    local url_path = "/auth_scheme/oauth2/{oAuth2AuthSchemeId}"
    url_path = url_path:gsub("{oAuth2AuthSchemeId}", uri.encode(tostring(oAuth2AuthSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an Auth Scheme
-- Updates an Auth Scheme with the specified data in the auth scheme request.
-- @path /auth_scheme/oauth2/{oAuth2AuthSchemeId}
-- @name updateAuthScheme_1
-- @param oAuth2AuthSchemeId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateAuthScheme_1(oAuth2AuthSchemeId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(oAuth2AuthSchemeId)

    local url_path = "/auth_scheme/oauth2/{oAuth2AuthSchemeId}"
    url_path = url_path:gsub("{oAuth2AuthSchemeId}", uri.encode(tostring(oAuth2AuthSchemeId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes an Auth Scheme
-- Deletes an Auth Scheme with the specified id.
-- @path /auth_scheme/oauth2/{oAuth2AuthSchemeId}
-- @name deleteAuthScheme_1
-- @param oAuth2AuthSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteAuthScheme_1(oAuth2AuthSchemeId, callback, retry_policy, cancellation_token)
    assert(oAuth2AuthSchemeId)

    local url_path = "/auth_scheme/oauth2/{oAuth2AuthSchemeId}"
    url_path = url_path:gsub("{oAuth2AuthSchemeId}", uri.encode(tostring(oAuth2AuthSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Session using OIDC
-- Begins a session by accepting a JWT. Upon successful validation against the scheme provided in the path, this will return a Session which can be used for authentication. If there is no User associated with the supplied credentials, this will implicitly create a new account and will include that account information in the response. If there is an account, or this method receives an existing session key, this will link to the existing scheme if the account was not previously linked.
-- @path /auth/oidc
-- @name createOidcSession
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createOidcSession(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/auth/oidc"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Lists all auth schemes in the system
-- Requires SUPERUSER access. Gets a pagination of Auth Schemes for the given query.
-- @path /auth_scheme/oidc
-- @name getAuthSchemes_2
-- @param offset 
-- @param count 
-- @param tags 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthSchemes_2(offset, count, tags, callback, retry_policy, cancellation_token)

    local url_path = "/auth_scheme/oidc"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Auth Scheme
-- Creates a new Auth Scheme, from the data in the given auth scheme request
-- @path /auth_scheme/oidc
-- @name createAuthScheme_2
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createAuthScheme_2(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/auth_scheme/oidc"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Auth Scheme
-- Gets a specific Auth Scheme by the oidcAuthSchemeId.
-- @path /auth_scheme/oidc/{oidcAuthSchemeId}
-- @name getAuthScheme_2
-- @param oidcAuthSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAuthScheme_2(oidcAuthSchemeId, callback, retry_policy, cancellation_token)
    assert(oidcAuthSchemeId)

    local url_path = "/auth_scheme/oidc/{oidcAuthSchemeId}"
    url_path = url_path:gsub("{oidcAuthSchemeId}", uri.encode(tostring(oidcAuthSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an Auth Scheme
-- Updates an Auth Scheme with the specified data in the auth scheme request.
-- @path /auth_scheme/oidc/{oidcAuthSchemeId}
-- @name updateAuthScheme_2
-- @param oidcAuthSchemeId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateAuthScheme_2(oidcAuthSchemeId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(oidcAuthSchemeId)

    local url_path = "/auth_scheme/oidc/{oidcAuthSchemeId}"
    url_path = url_path:gsub("{oidcAuthSchemeId}", uri.encode(tostring(oidcAuthSchemeId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes an Auth Scheme
-- Deletes an Auth Scheme with the specified id.
-- @path /auth_scheme/oidc/{oidcAuthSchemeId}
-- @name deleteAuthScheme_2
-- @param oidcAuthSchemeId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteAuthScheme_2(oidcAuthSchemeId, callback, retry_policy, cancellation_token)
    assert(oidcAuthSchemeId)

    local url_path = "/auth_scheme/oidc/{oidcAuthSchemeId}"
    url_path = url_path:gsub("{oidcAuthSchemeId}", uri.encode(tostring(oidcAuthSchemeId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets  contracts.
-- Gets a pagination of  SmartContracts.
-- @path /blockchain/omni/smart_contract
-- @name getSmartContracts
-- @param offset 
-- @param count 
-- @param api 
-- @param network 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSmartContracts(offset, count, api, network, callback, retry_policy, cancellation_token)

    local url_path = "/blockchain/omni/smart_contract"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["api"] = api
    query_params["network"] = network

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Patches a  Smart Contract
-- Patches a  Smart Contract entry, associated with the specified deployed script hash.
-- @path /blockchain/omni/smart_contract
-- @name createSmartContract
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createSmartContract(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/blockchain/omni/smart_contract"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific  Smart Contract
-- Gets a specific  Smart Contract by contractId.
-- @path /blockchain/omni/smart_contract/{contractId}
-- @name getSmartContract
-- @param contractId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSmartContract(contractId, callback, retry_policy, cancellation_token)
    assert(contractId)

    local url_path = "/blockchain/omni/smart_contract/{contractId}"
    url_path = url_path:gsub("{contractId}", uri.encode(tostring(contractId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Patches a  Smart Contract
-- Patches a  Smart Contract entry, associated with the specified deployed script hash.
-- @path /blockchain/omni/smart_contract/{contractId}
-- @name updateSmartContract
-- @param contractId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateSmartContract(contractId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(contractId)

    local url_path = "/blockchain/omni/smart_contract/{contractId}"
    url_path = url_path:gsub("{contractId}", uri.encode(tostring(contractId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a  Smart Contract
-- Deletes a  Smart Contract with the specified contractId.
-- @path /blockchain/omni/smart_contract/{contractId}
-- @name deleteContract
-- @param contractId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteContract(contractId, callback, retry_policy, cancellation_token)
    assert(contractId)

    local url_path = "/blockchain/omni/smart_contract/{contractId}"
    url_path = url_path:gsub("{contractId}", uri.encode(tostring(contractId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets  vaults. Optionally filtered for a specific user
-- Gets a pagination of  Wallets. Optionally a user Id can be specified to filter for a given user.
-- @path /blockchain/omni/vault
-- @name getVaults
-- @param offset 
-- @param count 
-- @param userId 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getVaults(offset, count, userId, callback, retry_policy, cancellation_token)

    local url_path = "/blockchain/omni/vault"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new  Vault
-- Creates a new  Vault, associated with the given user.
-- @path /blockchain/omni/vault
-- @name createVault
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createVault(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/blockchain/omni/vault"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific  Vault
-- Gets a specific  Vault by Id.
-- @path /blockchain/omni/vault/{vaultId}
-- @name getVault
-- @param vaultId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getVault(vaultId, callback, retry_policy, cancellation_token)
    assert(vaultId)

    local url_path = "/blockchain/omni/vault/{vaultId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a  Vault
-- Updates a  Vault with the specified name or id.
-- @path /blockchain/omni/vault/{vaultId}
-- @name updateVault
-- @param vaultId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateVault(vaultId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(vaultId)

    local url_path = "/blockchain/omni/vault/{vaultId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a  Vault
-- Deletes a  Vault with the specified id.
-- @path /blockchain/omni/vault/{vaultId}
-- @name deleteVault
-- @param vaultId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteVault(vaultId, callback, retry_policy, cancellation_token)
    assert(vaultId)

    local url_path = "/blockchain/omni/vault/{vaultId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets  wallets. Optionally filtered for a specific user
-- Gets a pagination of  Wallets. Optionally a user Id can be specified to filter for a given user.
-- @path /blockchain/omni/vault/{vaultId}/wallet
-- @name getWallets
-- @param offset 
-- @param count 
-- @param userId 
-- @param api 
-- @param network 
-- @param vaultId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getWallets(offset, count, userId, api, network, vaultId, callback, retry_policy, cancellation_token)
    assert(vaultId)

    local url_path = "/blockchain/omni/vault/{vaultId}/wallet"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId
    query_params["api"] = api
    query_params["network"] = network

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new  Wallet
-- Creates a new  Wallet, associated with the given user.
-- @path /blockchain/omni/vault/{vaultId}/wallet
-- @name createWallet
-- @param vaultId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createWallet(vaultId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(vaultId)

    local url_path = "/blockchain/omni/vault/{vaultId}/wallet"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific  Wallet
-- Gets a specific  Wallet by Id.
-- @path /blockchain/omni/vault/{vaultId}/wallet/{walletId}
-- @name getWallet
-- @param vaultId (REQUIRED) 
-- @param walletId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getWallet(vaultId, walletId, callback, retry_policy, cancellation_token)
    assert(vaultId)
    assert(walletId)

    local url_path = "/blockchain/omni/vault/{vaultId}/wallet/{walletId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))
    url_path = url_path:gsub("{walletId}", uri.encode(tostring(walletId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a  Wallet
-- Updates a  Wallet with the specified name or id.
-- @path /blockchain/omni/vault/{vaultId}/wallet/{walletId}
-- @name updateWallet
-- @param vaultId (REQUIRED) 
-- @param walletId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateWallet(vaultId, walletId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(vaultId)
    assert(walletId)

    local url_path = "/blockchain/omni/vault/{vaultId}/wallet/{walletId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))
    url_path = url_path:gsub("{walletId}", uri.encode(tostring(walletId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a  Wallet
-- Deletes a  Wallet with the specified id.
-- @path /blockchain/omni/vault/{vaultId}/wallet/{walletId}
-- @name deleteWallet
-- @param vaultId (REQUIRED) 
-- @param walletId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteWallet(vaultId, walletId, callback, retry_policy, cancellation_token)
    assert(vaultId)
    assert(walletId)

    local url_path = "/blockchain/omni/vault/{vaultId}/wallet/{walletId}"
    url_path = url_path:gsub("{vaultId}", uri.encode(tostring(vaultId)))
    url_path = url_path:gsub("{walletId}", uri.encode(tostring(walletId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific  Wallet
-- Gets a specific  Wallet by Id.
-- @path /blockchain/omni/wallet/{walletId}
-- @name getWallet_1
-- @param walletId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getWallet_1(walletId, callback, retry_policy, cancellation_token)
    assert(walletId)

    local url_path = "/blockchain/omni/wallet/{walletId}"
    url_path = url_path:gsub("{walletId}", uri.encode(tostring(walletId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}
-- @name getDeployments
-- @param applicationId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getDeployments(applicationId, callback, retry_policy, cancellation_token)
    assert(applicationId)

    local url_path = "/deployment/{applicationId}"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}
-- @name createNewDeployment
-- @param applicationId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createNewDeployment(applicationId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationId)

    local url_path = "/deployment/{applicationId}"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}/{deploymentId}
-- @name getDeployment
-- @param applicationId (REQUIRED) 
-- @param deploymentId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getDeployment(applicationId, deploymentId, callback, retry_policy, cancellation_token)
    assert(applicationId)
    assert(deploymentId)

    local url_path = "/deployment/{applicationId}/{deploymentId}"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))
    url_path = url_path:gsub("{deploymentId}", uri.encode(tostring(deploymentId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}/{deploymentId}
-- @name deleteDeployment
-- @param applicationId (REQUIRED) 
-- @param deploymentId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteDeployment(applicationId, deploymentId, callback, retry_policy, cancellation_token)
    assert(applicationId)
    assert(deploymentId)

    local url_path = "/deployment/{applicationId}/{deploymentId}"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))
    url_path = url_path:gsub("{deploymentId}", uri.encode(tostring(deploymentId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}/current
-- @name getCurrentDeployment
-- @param applicationId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getCurrentDeployment(applicationId, callback, retry_policy, cancellation_token)
    assert(applicationId)

    local url_path = "/deployment/{applicationId}/current"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /deployment/{applicationId}/{version}
-- @name updateDeployment
-- @param applicationId (REQUIRED) 
-- @param version (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateDeployment(applicationId, version, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(applicationId)
    assert(version)

    local url_path = "/deployment/{applicationId}/{version}"
    url_path = url_path:gsub("{applicationId}", uri.encode(tostring(applicationId)))
    url_path = url_path:gsub("{version}", uri.encode(tostring(version)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Generate Client API Code
-- Generates API code for use on the client. Will generate Elements core if no application is specified in the request body.
-- @path /codegen
-- @name generateCode
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.generateCode(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/codegen"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Followers
-- Searches all followers in the system and returning the metadata for all matches against the given profile id.
-- @path /followee/{profileId}
-- @name getFollowers
-- @param profileId (REQUIRED) 
-- @param offset 
-- @param count 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFollowers(profileId, offset, count, callback, retry_policy, cancellation_token)
    assert(profileId)

    local url_path = "/followee/{profileId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Followers
-- Searches all followers in the system and returning the metadata for all matches against the given profile id.
-- @path /follower/{profileId}
-- @name getFollowers_1
-- @param profileId (REQUIRED) 
-- @param offset 
-- @param count 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFollowers_1(profileId, offset, count, callback, retry_policy, cancellation_token)
    assert(profileId)

    local url_path = "/follower/{profileId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Follower relationship between two profiles.
-- Supplying the follower object, this will store the information supplied in the body of the request.
-- @path /follower/{profileId}
-- @name createFollower
-- @param profileId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createFollower(profileId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(profileId)

    local url_path = "/follower/{profileId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Follower relationship
-- 
-- @path /follower/{profileId}/{profileToUnfollowId}
-- @name deleteFollower
-- @param profileId (REQUIRED) 
-- @param profileToUnfollowId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteFollower(profileId, profileToUnfollowId, callback, retry_policy, cancellation_token)
    assert(profileId)
    assert(profileToUnfollowId)

    local url_path = "/follower/{profileId}/{profileToUnfollowId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))
    url_path = url_path:gsub("{profileToUnfollowId}", uri.encode(tostring(profileToUnfollowId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific profile using the ID of the profile and followed id.
-- 
-- @path /follower/{profileId}/{followedId}
-- @name getFollower
-- @param profileId (REQUIRED) 
-- @param followedId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFollower(profileId, followedId, callback, retry_policy, cancellation_token)
    assert(profileId)
    assert(followedId)

    local url_path = "/follower/{profileId}/{followedId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))
    url_path = url_path:gsub("{followedId}", uri.encode(tostring(followedId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Specific Friend
-- Gets a specific friend using the ID of the friend.
-- @path /friend/{friendId}
-- @name getFriend
-- @param friendId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFriend(friendId, callback, retry_policy, cancellation_token)
    assert(friendId)

    local url_path = "/friend/{friendId}"
    url_path = url_path:gsub("{friendId}", uri.encode(tostring(friendId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Friend
-- Once a friend is deleted, re-creating a friend will set the friendship status to outgoing.
-- @path /friend/{friendId}
-- @name deleteFriendRegistration
-- @param friendId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteFriendRegistration(friendId, callback, retry_policy, cancellation_token)
    assert(friendId)

    local url_path = "/friend/{friendId}"
    url_path = url_path:gsub("{friendId}", uri.encode(tostring(friendId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Friends
-- Searches all friends in the system and returning the metadata for all matches against the given search filter.
-- @path /friend
-- @name getFriends
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getFriends(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/friend"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves all Items
-- Searches all items and returns all matching items, filtered by the passed in search parameters.  If multiple tags are specified, then all items that contain at least one of the passed in tags is returned.
-- @path /item
-- @name getItems
-- @param offset 
-- @param count 
-- @param tags 
-- @param category 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getItems(offset, count, tags, category, search, callback, retry_policy, cancellation_token)

    local url_path = "/item"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags
    query_params["category"] = category
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new digital Item
-- Supplying an item object, this will create a new item with a newly assigned unique id.  The Item representation returned in the response body is a representation of the Item as persisted with a unique identifier signed and with its fields properly normalized.  The supplied item object submitted with the request must have a name property that is unique across all items.
-- @path /item
-- @name createItem
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createItem(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/item"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single Item by id or by name
-- Looks up an item by the passed in identifier
-- @path /item/{identifier}
-- @name getItemByIdentifier
-- @param identifier (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getItemByIdentifier(identifier, callback, retry_policy, cancellation_token)
    assert(identifier)

    local url_path = "/item/{identifier}"
    url_path = url_path:gsub("{identifier}", uri.encode(tostring(identifier)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a single Item
-- Supplying an item, this will update the Item identified by the identifier in the path with contents from the passed in request body.
-- @path /item/{identifier}
-- @name updateItem
-- @param identifier (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateItem(identifier, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(identifier)

    local url_path = "/item/{identifier}"
    url_path = url_path:gsub("{identifier}", uri.encode(tostring(identifier)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Delete the item as identified by the given item name/id
-- Delete the item as identified by the given item name/id
-- @path /item/{identifier}
-- @name deleteSimpleInventoryItem
-- @param identifier (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteSimpleInventoryItem(identifier, callback, retry_policy, cancellation_token)
    assert(identifier)

    local url_path = "/item/{identifier}"
    url_path = url_path:gsub("{identifier}", uri.encode(tostring(identifier)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Upload Google Play IAP Receipt data (package name, product id and Google Play-issued purchase token). Returns a list of RewardIssuances, some or all of which may be already redeemed.
-- 
-- @path /google/purchase
-- @name uploadGooglePlayIapPurchase
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.uploadGooglePlayIapPurchase(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/google/purchase"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Builds all indexes.
-- 
-- @path /index/build
-- @name buildIndexes
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.buildIndexes(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/index/build"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets all index plans.
-- 
-- @path /index/plan
-- @name getPlans
-- @param offset 
-- @param count 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getPlans(offset, count, callback, retry_policy, cancellation_token)

    local url_path = "/index/plan"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets inventory item for the specified item
-- Gets the first (primary) inventory item for the specified item
-- @path /inventory/advanced/{inventoryItemId}
-- @name getAdvancedInventoryItem
-- @param inventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAdvancedInventoryItem(inventoryItemId, callback, retry_policy, cancellation_token)
    assert(inventoryItemId)

    local url_path = "/inventory/advanced/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an inventory item for the specified item
-- Updates an inventory item for the specified item
-- @path /inventory/advanced/{inventoryItemId}
-- @name updateSimpleInventoryItem
-- @param inventoryItemId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateSimpleInventoryItem(inventoryItemId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(inventoryItemId)

    local url_path = "/inventory/advanced/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Delete the inventory item as identified by the given item name/id
-- Delete the inventory item as identified by the given item name/id
-- @path /inventory/advanced/{inventoryItemId}
-- @name deleteAdvancedInventoryItem
-- @param inventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteAdvancedInventoryItem(inventoryItemId, callback, retry_policy, cancellation_token)
    assert(inventoryItemId)

    local url_path = "/inventory/advanced/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Adjust the quantity of the inventory item for the specified item.
-- Adjust the quantity of the first (primary) inventory item for the specified item.  This implicitly will create the InventoryItem if it does not exist.  The inventory item value
-- @path /inventory/advanced/{inventoryItemId}
-- @name adjustAdvancedInventoryItemQuantity
-- @param inventoryItemId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.adjustAdvancedInventoryItemQuantity(inventoryItemId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(inventoryItemId)

    local url_path = "/inventory/advanced/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PATCH", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search inventory items
-- Searches all inventory items in the system and returns the metadata for all matches against the given search filter.
-- @path /inventory/advanced
-- @name getAdvancedInventoryItems
-- @param offset 
-- @param count 
-- @param userId 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAdvancedInventoryItems(offset, count, userId, search, callback, retry_policy, cancellation_token)

    local url_path = "/inventory/advanced"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Create an inventory item for the specified item
-- Create an inventory item for the specified item
-- @path /inventory/advanced
-- @name createAdvancedInventoryItem
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createAdvancedInventoryItem(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/inventory/advanced"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search inventory items
-- Searches all inventory items in the system and returns the metadata for all matches against the given search filter.
-- @path /inventory/distinct
-- @name getDistinctInventoryItems
-- @param offset 
-- @param count 
-- @param userId 
-- @param profileId 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getDistinctInventoryItems(offset, count, userId, profileId, search, callback, retry_policy, cancellation_token)

    local url_path = "/inventory/distinct"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId
    query_params["profileId"] = profileId
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Create an inventory item for the specified item
-- Create an inventory item for the specified item
-- @path /inventory/distinct
-- @name createDistinctInventoryItem
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createDistinctInventoryItem(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/inventory/distinct"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an inventory item for the specified item
-- Updates an inventory item for the specified item
-- @path /inventory/distinct/{distinctInventoryItemId}
-- @name updateDistinctInventoryItem
-- @param distinctInventoryItemId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateDistinctInventoryItem(distinctInventoryItemId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(distinctInventoryItemId)

    local url_path = "/inventory/distinct/{distinctInventoryItemId}"
    url_path = url_path:gsub("{distinctInventoryItemId}", uri.encode(tostring(distinctInventoryItemId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Delete the inventory item as identified by the given item name/id
-- Delete the inventory item as identified by the given item name/id
-- @path /inventory/distinct/{distinctInventoryItemId}
-- @name deleteDistinctInventoryItem
-- @param distinctInventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteDistinctInventoryItem(distinctInventoryItemId, callback, retry_policy, cancellation_token)
    assert(distinctInventoryItemId)

    local url_path = "/inventory/distinct/{distinctInventoryItemId}"
    url_path = url_path:gsub("{distinctInventoryItemId}", uri.encode(tostring(distinctInventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets inventory item for the specified item
-- Gets the first (primary) inventory item for the specified item
-- @path /inventory/distinct/{inventoryItemId}
-- @name getDistinctInventoryItem
-- @param inventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getDistinctInventoryItem(inventoryItemId, callback, retry_policy, cancellation_token)
    assert(inventoryItemId)

    local url_path = "/inventory/distinct/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets inventory item for the specified item
-- Gets the first (primary) inventory item for the specified item
-- @path /inventory/simple/{inventoryItemId}
-- @name getSimpleInventoryItem
-- @param inventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSimpleInventoryItem(inventoryItemId, callback, retry_policy, cancellation_token)
    assert(inventoryItemId)

    local url_path = "/inventory/simple/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an inventory item for the specified item
-- Updates an inventory item for the specified item
-- @path /inventory/simple/{inventoryItemId}
-- @name updateSimpleInventoryItem_1
-- @param inventoryItemId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateSimpleInventoryItem_1(inventoryItemId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(inventoryItemId)

    local url_path = "/inventory/simple/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Delete the inventory item as identified by the given item name/id
-- Delete the inventory item as identified by the given item name/id
-- @path /inventory/simple/{inventoryItemId}
-- @name deleteSimpleInventoryItem_1
-- @param inventoryItemId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteSimpleInventoryItem_1(inventoryItemId, callback, retry_policy, cancellation_token)
    assert(inventoryItemId)

    local url_path = "/inventory/simple/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Adjust the quantity of the inventory item for the specified item.
-- Adjust the quantity of the first (primary) inventory item for the specified item.  This implicitly will create the InventoryItem if it does not exist.  The inventory item value
-- @path /inventory/simple/{inventoryItemId}
-- @name adjustSimpleInventoryItemQuantity
-- @param inventoryItemId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.adjustSimpleInventoryItemQuantity(inventoryItemId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(inventoryItemId)

    local url_path = "/inventory/simple/{inventoryItemId}"
    url_path = url_path:gsub("{inventoryItemId}", uri.encode(tostring(inventoryItemId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PATCH", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search inventory items
-- Searches all inventory items in the system and returns the metadata for all matches against the given search filter.
-- @path /inventory/simple
-- @name getSimpleInventoryItems
-- @param offset 
-- @param count 
-- @param userId 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSimpleInventoryItems(offset, count, userId, search, callback, retry_policy, cancellation_token)

    local url_path = "/inventory/simple"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Create an inventory item for the specified item
-- Create an inventory item for the specified item
-- @path /inventory/simple
-- @name createSimpleInventoryItem
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createSimpleInventoryItem(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/inventory/simple"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Match normalized phone numbers with requested list
-- Both phones from request and from DB are normalized and compared.
-- @path /invite
-- @name getMatchedUserProfilesWithPhoneNumbers
-- @param offset 
-- @param count 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatchedUserProfilesWithPhoneNumbers(offset, count, body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/invite"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a LargeObject with content
-- 
-- @path /large_object_mp
-- @name createLargeObject
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createLargeObject(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/large_object_mp"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get a LargeObject
-- 
-- @path /large_object
-- @name getLargeObjects
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getLargeObjects(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/large_object"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a LargeObject
-- 
-- @path /large_object
-- @name createLargeObject_1
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createLargeObject_1(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/large_object"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a LargeObject from provided URL
-- 
-- @path /large_object/from_url
-- @name createLargeObjectFromUrl
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createLargeObjectFromUrl(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/large_object/from_url"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get a LargeObject
-- 
-- @path /large_object/{largeObjectId}
-- @name getLargeObject
-- @param largeObjectId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getLargeObject(largeObjectId, callback, retry_policy, cancellation_token)
    assert(largeObjectId)

    local url_path = "/large_object/{largeObjectId}"
    url_path = url_path:gsub("{largeObjectId}", uri.encode(tostring(largeObjectId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a LargeObject
-- 
-- @path /large_object/{largeObjectId}
-- @name updateLargeObject
-- @param largeObjectId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateLargeObject(largeObjectId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(largeObjectId)

    local url_path = "/large_object/{largeObjectId}"
    url_path = url_path:gsub("{largeObjectId}", uri.encode(tostring(largeObjectId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a LargeObject
-- 
-- @path /large_object/{largeObjectId}
-- @name deleteLargeObject
-- @param largeObjectId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteLargeObject(largeObjectId, callback, retry_policy, cancellation_token)
    assert(largeObjectId)

    local url_path = "/large_object/{largeObjectId}"
    url_path = url_path:gsub("{largeObjectId}", uri.encode(tostring(largeObjectId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a LargeObject content
-- 
-- @path /large_object/{largeObjectId}/content
-- @name updateLargeObjectContents
-- @param largeObjectId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateLargeObjectContents(largeObjectId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(largeObjectId)

    local url_path = "/large_object/{largeObjectId}/content"
    url_path = url_path:gsub("{largeObjectId}", uri.encode(tostring(largeObjectId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Leaderboards
-- Performs a full-text search of all leaderboards known to the server.  As with other full-text endpoints this allows for pagination and offset.
-- @path /leaderboard
-- @name getLeaderboards
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getLeaderboards(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/leaderboard"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a New Leaderboard
-- Gets the metadata for a single leaderboard.  This may include more specific details not available in the bulk-get or fetch operation.
-- @path /leaderboard
-- @name createLeaderboard
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createLeaderboard(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/leaderboard"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get an Leaderboard
-- Gets the metadata for a single leaderboard.  This may include more specific details not availble in the bulk-get or fetch operation.
-- @path /leaderboard/{nameOrId}
-- @name getLeaderboard
-- @param nameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getLeaderboard(nameOrId, callback, retry_policy, cancellation_token)
    assert(nameOrId)

    local url_path = "/leaderboard/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an Leaderboard
-- Performs an update to an existing leaderboard known to the server.
-- @path /leaderboard/{nameOrId}
-- @name updateLeaderboard
-- @param nameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateLeaderboard(nameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(nameOrId)

    local url_path = "/leaderboard/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes an Leaderboard
-- Deletes a specific leaderboard known to the server.
-- @path /leaderboard/{nameOrId}
-- @name deleteLeaderboard
-- @param nameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteLeaderboard(nameOrId, callback, retry_policy, cancellation_token)
    assert(nameOrId)

    local url_path = "/leaderboard/{nameOrId}"
    url_path = url_path:gsub("{nameOrId}", uri.encode(tostring(nameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets Rank Among all Players
-- Gets the current Profile&#x27;s rank among all players for the particular leaderboard.
-- @path /rank/global/{leaderboardNameOrId}
-- @name getGlobalRankTabular
-- @param leaderboardNameOrId (REQUIRED) Specifies the leaderboard name or ID.
-- @param leaderboardEpoch Specifies the epoch for the leaderboard. If not provided, the current epoch will be used by default for epochal leaderboards. This value will be ignored for all-time leaderboards. Set this value to 0 to explicitly reference the current epoch (when applicable).
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getGlobalRankTabular(leaderboardNameOrId, leaderboardEpoch, callback, retry_policy, cancellation_token)
    assert(leaderboardNameOrId)

    local url_path = "/rank/global/{leaderboardNameOrId}"
    url_path = url_path:gsub("{leaderboardNameOrId}", uri.encode(tostring(leaderboardNameOrId)))

    local query_params = {}
    query_params["leaderboardEpoch"] = leaderboardEpoch

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets Rank among Friends
-- Gets the current Profile&#x27;s rank among friends for the particular leaderboard.
-- @path /rank/friends/{leaderboardNameOrId}
-- @name getRankAmongFriends
-- @param offset May be negative to place the requested player in the middle of the page.
-- @param count The number of results to return in the page.
-- @param relative Indicates whether or not to fetch results in a relative fashion.
-- @param leaderboardEpoch Specifies the epoch for the leaderboard. If no value is provided, the current epoch will befetched.
-- @param leaderboardNameOrId (REQUIRED) Specifies the leaderboard name or ID.
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getRankAmongFriends(offset, count, relative, leaderboardEpoch, leaderboardNameOrId, callback, retry_policy, cancellation_token)
    assert(leaderboardNameOrId)

    local url_path = "/rank/friends/{leaderboardNameOrId}"
    url_path = url_path:gsub("{leaderboardNameOrId}", uri.encode(tostring(leaderboardNameOrId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["relative"] = relative
    query_params["leaderboardEpoch"] = leaderboardEpoch

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets Rank among Mutual Followers
-- Gets the current Profile&#x27;s rank among mutual followers for the particular leaderboard.
-- @path /rank/mutual_followers/{leaderboardNameOrId}
-- @name getRankAmongMutualFollowers
-- @param offset May be negative to place the requested player in the middle of the page.
-- @param count The number of results to return in the page.
-- @param relative Indicates whether or not to fetch results in a relative fashion.
-- @param leaderboardEpoch Specifies the epoch for the leaderboard. If no value is provided, the current epoch will befetched.
-- @param leaderboardNameOrId (REQUIRED) Specifies the leaderboard name or ID.
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getRankAmongMutualFollowers(offset, count, relative, leaderboardEpoch, leaderboardNameOrId, callback, retry_policy, cancellation_token)
    assert(leaderboardNameOrId)

    local url_path = "/rank/mutual_followers/{leaderboardNameOrId}"
    url_path = url_path:gsub("{leaderboardNameOrId}", uri.encode(tostring(leaderboardNameOrId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["relative"] = relative
    query_params["leaderboardEpoch"] = leaderboardEpoch

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a New Score
-- Posts a single score for the currently logged-in profile. Conceptually, this is creationg a new resource, however the server may opt to overwrite the existing identifier if it sees fit.
-- @path /score/{leaderboardNameOrId}
-- @name createScore
-- @param leaderboardNameOrId (REQUIRED) The name or id of the leaderboard.
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createScore(leaderboardNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(leaderboardNameOrId)

    local url_path = "/score/{leaderboardNameOrId}"
    url_path = url_path:gsub("{leaderboardNameOrId}", uri.encode(tostring(leaderboardNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- List Matches
-- Lists all matches available.  Under most circumstances, this will requires that a profile be made available to the request.  The server may choose to return an error if no suitable profile can be determined.
-- @path /match
-- @name getMatches
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatches(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/match"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Match
-- This method accepts an instance of Match, effectively requesting that the server find a suitable opponent for a game.  As other suitable players create matches the created match object may be updated as a suitable opponent is found.  The client must poll matches for updates and react accordingly.
-- @path /match
-- @name createMatch
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMatch(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/match"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Specific Match
-- Gets a specific match given the match&#x27;s unique ID.  Additionally, it is possible to instruct the API to wait for a period of time before sending the response.  The request will intentionally hang until the requested Match with ID has been updated in the database.
-- @path /match/{matchId}
-- @name getMatch
-- @param matchId (REQUIRED) 
-- @param SocialEngine_LongPoll_Timeout The maximum amount time the server will wait until a request returns a default set of data for long polling.  Specifying a zero will request that the server wait indefinitely until responding.  Though, the server may enforce a practical upper limit on the amount of time it takes to return.  Omitting this header will prompt the server to treat the request as a normal request.
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatch(matchId, SocialEngine_LongPoll_Timeout, callback, retry_policy, cancellation_token)
    assert(matchId)

    local url_path = "/match/{matchId}"
    url_path = url_path:gsub("{matchId}", uri.encode(tostring(matchId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Match
-- Deletes and permanently removes the Match fromt he server.  This effectively will cancel any pending request for a match.  If a game is currently being played agaist the match, the server may reject the request to delete the match until the game concludes.
-- @path /match/{matchId}
-- @name deleteMatch
-- @param matchId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMatch(matchId, callback, retry_policy, cancellation_token)
    assert(matchId)

    local url_path = "/match/{matchId}"
    url_path = url_path:gsub("{matchId}", uri.encode(tostring(matchId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- List MultiMatches
-- Lists all matches available.  Under most circumstances, this will requires that a profile be made available to the request.  The server may choose to return an error if no suitable profile can be determined.
-- @path /multi_match
-- @name getMatches_1
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatches_1(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/multi_match"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a MultiMatch
-- This method accepts an instance of MultiMatch and creates a new DB entry for it. Though it is generally recommended to create a new MultiMatch via matchmaking code in an Element, it can be created via REST for the purposes of testing or custom workflows.
-- @path /multi_match
-- @name createMatch_1
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMatch_1(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/multi_match"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a MultiMatch
-- Deletes and permanently removes all MultiMatches from he server.  This effectively will cancel any pending request for a match.  If a game is currently being played against the match, the server may reject the request to delete the match until the game concludes.
-- @path /multi_match
-- @name deleteAllMatches
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteAllMatches(callback, retry_policy, cancellation_token)

    local url_path = "/multi_match"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Specific MultiMatch
-- Gets a specific match given the match&#x27;s unique ID.  Additionally, it is possible to instruct the API to wait for a period of time before sending the response.  The request will intentionally hang until the requested MultiMatch with ID has been updated in the database.
-- @path /multi_match/{matchId}
-- @name getMatch_1
-- @param matchId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMatch_1(matchId, callback, retry_policy, cancellation_token)
    assert(matchId)

    local url_path = "/multi_match/{matchId}"
    url_path = url_path:gsub("{matchId}", uri.encode(tostring(matchId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a MultiMatch
-- This method accepts an instance of MultiMatch and updates the DB entry for it that matches the matchId. Though it is generally recommended to update a MultiMatch via matchmaking code in an Element, it can be updated via REST for the purposes of testing or custom workflows.
-- @path /multi_match/{matchId}
-- @name updateMatch
-- @param matchId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateMatch(matchId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(matchId)

    local url_path = "/multi_match/{matchId}"
    url_path = url_path:gsub("{matchId}", uri.encode(tostring(matchId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a MultiMatch
-- Deletes and permanently removes the MultiMatch from he server.  This effectively will cancel any pending request for a match.  If a game is currently being played against the match, the server may reject the request to delete the match until the game concludes.
-- @path /multi_match/{matchId}
-- @name deleteMatch_1
-- @param matchId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMatch_1(matchId, callback, retry_policy, cancellation_token)
    assert(matchId)

    local url_path = "/multi_match/{matchId}"
    url_path = url_path:gsub("{matchId}", uri.encode(tostring(matchId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Metadata
-- Searches all metadata in the system and returning all matches against the given search filter.
-- @path /metadata
-- @name getMetadataObjects
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMetadataObjects(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/metadata"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Metadata object
-- Creates a new Metadata object with the provided details.
-- @path /metadata
-- @name createMetadata
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMetadata(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/metadata"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Metadata object
-- Gets a specific metadata object by name or id.
-- @path /metadata/{id}
-- @name getMetadataObject
-- @param id (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMetadataObject(id, callback, retry_policy, cancellation_token)
    assert(id)

    local url_path = "/metadata/{id}"
    url_path = url_path:gsub("{id}", uri.encode(tostring(id)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a specific Metadata object
-- Updates a specific metadata object by name or id.
-- @path /metadata/{id}
-- @name updateMetadata
-- @param id (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateMetadata(id, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(id)

    local url_path = "/metadata/{id}"
    url_path = url_path:gsub("{id}", uri.encode(tostring(id)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a specific Metadata object
-- Deletes a specific metadata object by name or id.
-- @path /metadata/{id}
-- @name deleteMetadata
-- @param id (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMetadata(id, callback, retry_policy, cancellation_token)
    assert(id)

    local url_path = "/metadata/{id}"
    url_path = url_path:gsub("{id}", uri.encode(tostring(id)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Missions
-- Searches all missions in the system and returning a number of matches against the given search filter, delimited by the offset and count.
-- @path /mission
-- @name getMissions
-- @param offset 
-- @param count 
-- @param tags 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMissions(offset, count, tags, search, callback, retry_policy, cancellation_token)

    local url_path = "/mission"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new mission
-- Supplying a mission object, this will create a new mission with a newly assigned unique id.  The Mission representation returned in the response body is a representation of the Mission as persisted with a unique identifier assigned and with its fields properly normalized.  The supplied mission object submitted with the request must have a name property that is unique across all items.
-- @path /mission
-- @name createMission
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMission(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/mission"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single Mission by id or by name
-- Looks up a mission by the passed in identifier
-- @path /mission/{missionNameOrId}
-- @name getMissionByNameOrId
-- @param missionNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMissionByNameOrId(missionNameOrId, callback, retry_policy, cancellation_token)
    assert(missionNameOrId)

    local url_path = "/mission/{missionNameOrId}"
    url_path = url_path:gsub("{missionNameOrId}", uri.encode(tostring(missionNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an entire single Mission
-- Supplying a mission, this will update the Mission identified by the name or ID in the path with contents from the passed in request body.
-- @path /mission/{missionNameOrId}
-- @name updateMission
-- @param missionNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateMission(missionNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(missionNameOrId)

    local url_path = "/mission/{missionNameOrId}"
    url_path = url_path:gsub("{missionNameOrId}", uri.encode(tostring(missionNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes the Mission identified by id or by name
-- Deletes a mission by the passed in identifier
-- @path /mission/{missionNameOrId}
-- @name deleteMission
-- @param missionNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMission(missionNameOrId, callback, retry_policy, cancellation_token)
    assert(missionNameOrId)

    local url_path = "/mission/{missionNameOrId}"
    url_path = url_path:gsub("{missionNameOrId}", uri.encode(tostring(missionNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets Rank Among all Players
-- Gets the current Profile&#x27;s rank among all players for the particular leaderboard.
-- @path /progress
-- @name getProgressTabular
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getProgressTabular(callback, retry_policy, cancellation_token)

    local url_path = "/progress"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new progress
-- Supplying a progress object, this will create a new progress with a newly assigned unique id.  The Progress representation returned in the response body is a representation of the Progress as persisted with a unique identifier assigned and with its fields properly normalized.
-- @path /progress
-- @name createProgress
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createProgress(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/progress"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes the Progress identified by id
-- Deletes a progress by the passed in identifier
-- @path /progress/progress/{progressId}
-- @name deleteProgress
-- @param progressId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteProgress(progressId, callback, retry_policy, cancellation_token)
    assert(progressId)

    local url_path = "/progress/progress/{progressId}"
    url_path = url_path:gsub("{progressId}", uri.encode(tostring(progressId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single Progress by id
-- Looks up a progress by the passed in identifier
-- @path /progress/{progressId}
-- @name getProgressByNameOrId
-- @param progressId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getProgressByNameOrId(progressId, callback, retry_policy, cancellation_token)
    assert(progressId)

    local url_path = "/progress/{progressId}"
    url_path = url_path:gsub("{progressId}", uri.encode(tostring(progressId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a single Progress
-- Supplying a progress, this will update the Progress identified by the ID in the path with contents from the passed in request body.
-- @path /progress/{progressId}
-- @name updateProgress
-- @param progressId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateProgress(progressId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(progressId)

    local url_path = "/progress/{progressId}"
    url_path = url_path:gsub("{progressId}", uri.encode(tostring(progressId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single RewardIssuance by id.
-- 
-- @path /reward_issuance/{rewardIssuanceId}
-- @name getRewardIssuance
-- @param rewardIssuanceId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getRewardIssuance(rewardIssuanceId, callback, retry_policy, cancellation_token)
    assert(rewardIssuanceId)

    local url_path = "/reward_issuance/{rewardIssuanceId}"
    url_path = url_path:gsub("{rewardIssuanceId}", uri.encode(tostring(rewardIssuanceId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves the current user&#x27;s reward issuances, optionally filtered by the given state.
-- 
-- @path /reward_issuance
-- @name getRewardIssuances
-- @param offset 
-- @param count 
-- @param states 
-- @param tags 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getRewardIssuances(offset, count, states, tags, callback, retry_policy, cancellation_token)

    local url_path = "/reward_issuance"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["states"] = states
    query_params["tags"] = tags

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Redeems the RewardIssuance.
-- 
-- @path /reward_issuance/{rewardIssuanceId}/redeem
-- @name redeemRewardIssuance
-- @param rewardIssuanceId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.redeemRewardIssuance(rewardIssuanceId, callback, retry_policy, cancellation_token)
    assert(rewardIssuanceId)

    local url_path = "/reward_issuance/{rewardIssuanceId}/redeem"
    url_path = url_path:gsub("{rewardIssuanceId}", uri.encode(tostring(rewardIssuanceId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Redeems the given list of RewardIssuances.
-- 
-- @path /reward_issuance/redeem
-- @name redeemRewardIssuances
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.redeemRewardIssuances(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/reward_issuance/redeem"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search ScheduleEvents
-- Searches all schedules in the system and returning a number of matches against the given search filter, delimited by the offset and count.
-- @path /schedule/{scheduleNameOrId}/event
-- @name getScheduleEvents
-- @param scheduleNameOrId (REQUIRED) 
-- @param offset 
-- @param count 
-- @param tags 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getScheduleEvents(scheduleNameOrId, offset, count, tags, search, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}/event"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new schedule
-- Supplying a schedule object, this will create a new schedule with a newly assigned unique id.  The ScheduleEvent representation returned in the response body is a representation of the ScheduleEvent as persisted with a unique identifier assigned and with its fields properly normalized.  The supplied schedule object submitted with the request must have a name property that is unique across all items.
-- @path /schedule/{scheduleNameOrId}/event
-- @name createScheduleEvent
-- @param scheduleNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createScheduleEvent(scheduleNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}/event"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single ScheduleEvent by id or by name
-- Looks up a schedule by the passed in identifier
-- @path /schedule/{scheduleNameOrId}/event/{scheduleEventId}
-- @name getScheduleEventByNameOrId
-- @param scheduleNameOrId (REQUIRED) 
-- @param scheduleEventId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getScheduleEventByNameOrId(scheduleNameOrId, scheduleEventId, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)
    assert(scheduleEventId)

    local url_path = "/schedule/{scheduleNameOrId}/event/{scheduleEventId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))
    url_path = url_path:gsub("{scheduleEventId}", uri.encode(tostring(scheduleEventId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an entire single ScheduleEvent
-- Supplying a schedule, this will update the ScheduleEvent identified by the name or ID in the path with contents from the passed in request body.
-- @path /schedule/{scheduleNameOrId}/event/{scheduleEventId}
-- @name updateScheduleEvent
-- @param scheduleNameOrId (REQUIRED) 
-- @param scheduleEventId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateScheduleEvent(scheduleNameOrId, scheduleEventId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(scheduleNameOrId)
    assert(scheduleEventId)

    local url_path = "/schedule/{scheduleNameOrId}/event/{scheduleEventId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))
    url_path = url_path:gsub("{scheduleEventId}", uri.encode(tostring(scheduleEventId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes the ScheduleEvent identified by id or by name
-- Deletes a schedule by the passed in identifier
-- @path /schedule/{scheduleNameOrId}/event/{scheduleEventId}
-- @name deleteScheduleEvent
-- @param scheduleNameOrId (REQUIRED) 
-- @param scheduleEventId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteScheduleEvent(scheduleNameOrId, scheduleEventId, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)
    assert(scheduleEventId)

    local url_path = "/schedule/{scheduleNameOrId}/event/{scheduleEventId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))
    url_path = url_path:gsub("{scheduleEventId}", uri.encode(tostring(scheduleEventId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets all Progresses assigned via this schedule
-- Fetches all current assignments to the currently logged-in profile.
-- @path /schedule/{scheduleNameOrId}/progress
-- @name getScheduleProgresses
-- @param scheduleNameOrId (REQUIRED) 
-- @param offset 
-- @param count 
-- @param tags 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getScheduleProgresses(scheduleNameOrId, offset, count, tags, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}/progress"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Schedules
-- Searches all schedules in the system and returning a number of matches against the given search filter, delimited by the offset and count.
-- @path /schedule
-- @name getSchedules
-- @param offset 
-- @param count 
-- @param tags 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSchedules(offset, count, tags, search, callback, retry_policy, cancellation_token)

    local url_path = "/schedule"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["tags"] = tags
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new schedule
-- Supplying a schedule object, this will create a new schedule with a newly assigned unique id.  The Schedule representation returned in the response body is a representation of the Schedule as persisted with a unique identifier assigned and with its fields properly normalized.  The supplied schedule object submitted with the request must have a name property that is unique across all items.
-- @path /schedule
-- @name createSchedule
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createSchedule(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/schedule"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Retrieves a single Schedule by id or by name
-- Looks up a schedule by the passed in identifier
-- @path /schedule/{scheduleNameOrId}
-- @name getScheduleByNameOrId
-- @param scheduleNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getScheduleByNameOrId(scheduleNameOrId, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates an entire single Schedule
-- Supplying a schedule, this will update the Schedule identified by the name or ID in the path with contents from the passed in request body.
-- @path /schedule/{scheduleNameOrId}
-- @name updateSchedule
-- @param scheduleNameOrId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateSchedule(scheduleNameOrId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes the Schedule identified by id or by name
-- Deletes a schedule by the passed in identifier
-- @path /schedule/{scheduleNameOrId}
-- @name deleteSchedule
-- @param scheduleNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteSchedule(scheduleNameOrId, callback, retry_policy, cancellation_token)
    assert(scheduleNameOrId)

    local url_path = "/schedule/{scheduleNameOrId}"
    url_path = url_path:gsub("{scheduleNameOrId}", uri.encode(tostring(scheduleNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates an FCM Registration Token
-- Supplying FCM registration token, this will create a new token based on the information supplied to the endpoint.  The response will contain the token as it was written to the database.  Clients may subsequently update the token string with new values as they are issued by Firebase.
-- @path /notification/fcm
-- @name createFCMRegistration
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createFCMRegistration(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/notification/fcm"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Update an FCM Registration Token
-- Supplying FCM registration token, this will update the token string with the supplied values.  Clients may update the same registration with a different token issued with Firebase if they wish to simply retain the association with the
-- @path /notification/fcm/{fcmRegistrationId}
-- @name updateRegistration
-- @param fcmRegistrationId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateRegistration(fcmRegistrationId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(fcmRegistrationId)

    local url_path = "/notification/fcm/{fcmRegistrationId}"
    url_path = url_path:gsub("{fcmRegistrationId}", uri.encode(tostring(fcmRegistrationId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- 
-- 
-- @path /notification/fcm/{fcmRegistrationId}
-- @name deleteFCMRegistration
-- @param fcmRegistrationId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteFCMRegistration(fcmRegistrationId, callback, retry_policy, cancellation_token)
    assert(fcmRegistrationId)

    local url_path = "/notification/fcm/{fcmRegistrationId}"
    url_path = url_path:gsub("{fcmRegistrationId}", uri.encode(tostring(fcmRegistrationId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Profiles
-- Searches all users in the system and returning the metadata for all matches against the given search filter. Optionally provide `before` and `after` params to specify a time range [`after`, `before`] for last-logged-in profiles matching in that range (inclusive). If `before` is not specified (or a negative number is provided) but `after` is valid, the query will return all records successive to the given `after` timestamp. Similarly, if `after` is not specified (or a negative number is provided) but `before` is valid, the query will return all records preceding the given `before` timestamp. Note that search and time range parameters currently cannot be combined in the same query.
-- @path /profile
-- @name getProfiles
-- @param offset 
-- @param count 
-- @param before 
-- @param after 
-- @param application 
-- @param user 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getProfiles(offset, count, before, after, application, user, search, callback, retry_policy, cancellation_token)

    local url_path = "/profile"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["before"] = before
    query_params["after"] = after
    query_params["application"] = application
    query_params["user"] = user
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Profile
-- Supplying the create profile request, this will update the profile with the new information supplied in the body of the request. This will fire an event, dev.getelements.elements.service.profile.created, from the event manifest.
-- @path /profile
-- @name createProfile
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createProfile(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/profile"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Profile
-- Supplying an update request will attempt to update the profile.  The call will return the profile as it was written to the database.
-- @path /profile/{profileId}
-- @name updateProfile
-- @param profileId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateProfile(profileId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(profileId)

    local url_path = "/profile/{profileId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a Profile
-- Deletes and permanently removes the Profile from the server.  The server maykeep some record around to preserve relationships and references, but this profile will not be accessible again until it is recreated.
-- @path /profile/{profileId}
-- @name deactivateProfile
-- @param profileId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deactivateProfile(profileId, callback, retry_policy, cancellation_token)
    assert(profileId)

    local url_path = "/profile/{profileId}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets the current Profile
-- This is a special endpoing which fetches the current Profile based on current auth credentials.  This considers the currently loggged-in Dser as well as the Application or Application Configuration against which the User is operating.  This may not be availble, in which case the appopraite error is rasied.
-- @path /profile/current
-- @name getCurrentProfile
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getCurrentProfile(callback, retry_policy, cancellation_token)

    local url_path = "/profile/current"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Specific Profile
-- Gets a specific profile by profile ID.
-- @path /profile/{name}
-- @name getProfile
-- @param name (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getProfile(name, callback, retry_policy, cancellation_token)
    assert(name)

    local url_path = "/profile/{name}"
    url_path = url_path:gsub("{name}", uri.encode(tostring(name)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Profile image object
-- 
-- @path /profile/{profileId}/image
-- @name updateProfileImage
-- @param profileId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateProfileImage(profileId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(profileId)

    local url_path = "/profile/{profileId}/image"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Save Data Documents
-- Gets all save data documents available to the user.
-- @path /save_data
-- @name getSaveDataDocuments
-- @param offset 
-- @param count 
-- @param userId 
-- @param profileId 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSaveDataDocuments(offset, count, userId, profileId, search, callback, retry_policy, cancellation_token)

    local url_path = "/save_data"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["userId"] = userId
    query_params["profileId"] = profileId
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a save data document.
-- Gets a single save data document.
-- @path /save_data
-- @name createSaveDocument
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createSaveDocument(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/save_data"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a save data document.
-- Gets a single save data document.
-- @path /save_data/{saveDataDocumentId}
-- @name updateSaveDocument
-- @param saveDataDocumentId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateSaveDocument(saveDataDocumentId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(saveDataDocumentId)

    local url_path = "/save_data/{saveDataDocumentId}"
    url_path = url_path:gsub("{saveDataDocumentId}", uri.encode(tostring(saveDataDocumentId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a save data document
-- 
-- @path /save_data/{saveDataDocumentId}
-- @name deleteSaveDocument
-- @param saveDataDocumentId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteSaveDocument(saveDataDocumentId, callback, retry_policy, cancellation_token)
    assert(saveDataDocumentId)

    local url_path = "/save_data/{saveDataDocumentId}"
    url_path = url_path:gsub("{saveDataDocumentId}", uri.encode(tostring(saveDataDocumentId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get save data document.
-- Gets a single save data document based on Profile ID and slot. This is a convenience method whichallows the client to fetch a save data based on slot an profile id.
-- @path /save_data/profile/{profileId}/{slot}
-- @name getProfileSaveDataDocumentBySlot
-- @param profileId (REQUIRED) 
-- @param slot (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getProfileSaveDataDocumentBySlot(profileId, slot, callback, retry_policy, cancellation_token)
    assert(profileId)
    assert(slot)

    local url_path = "/save_data/profile/{profileId}/{slot}"
    url_path = url_path:gsub("{profileId}", uri.encode(tostring(profileId)))
    url_path = url_path:gsub("{slot}", uri.encode(tostring(slot)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get save data document.
-- Gets a single save data document
-- @path /save_data/{id}
-- @name getSaveDataDocument
-- @param id (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getSaveDataDocument(id, callback, retry_policy, cancellation_token)
    assert(id)

    local url_path = "/save_data/{id}"
    url_path = url_path:gsub("{id}", uri.encode(tostring(id)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get save data document.
-- Gets a single save data document based on UserID and slot. This is a convenience method whichallows the client to fetch a save data based on slot an user id.
-- @path /save_data/user/{userId}/{slot}
-- @name getUserSaveDataDocumentBySlot
-- @param userId (REQUIRED) 
-- @param slot (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getUserSaveDataDocumentBySlot(userId, slot, callback, retry_policy, cancellation_token)
    assert(userId)
    assert(slot)

    local url_path = "/save_data/user/{userId}/{slot}"
    url_path = url_path:gsub("{userId}", uri.encode(tostring(userId)))
    url_path = url_path:gsub("{slot}", uri.encode(tostring(slot)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Get Metadata Specs
-- Gets a pagination of Metadata Specs for the given query.
-- @path /metadata_spec
-- @name getMetadataSpecs
-- @param offset 
-- @param count 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMetadataSpecs(offset, count, callback, retry_policy, cancellation_token)

    local url_path = "/metadata_spec"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a new Metadata Spec definition
-- Creates a new Metadata Spec definition.
-- @path /metadata_spec
-- @name createMetadataSpec
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMetadataSpec(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/metadata_spec"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a Metadata Spec
-- Updates a MetadataSpec with the specified id.
-- @path /metadata_spec/{metadataSpecId}
-- @name updateMetadataSpec
-- @param metadataSpecId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateMetadataSpec(metadataSpecId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(metadataSpecId)

    local url_path = "/metadata_spec/{metadataSpecId}"
    url_path = url_path:gsub("{metadataSpecId}", uri.encode(tostring(metadataSpecId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a MetadataSpec
-- Deletes a MetadataSpec with the specified id.
-- @path /metadata_spec/{metadataSpecId}
-- @name deleteMetadataSpec
-- @param metadataSpecId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deleteMetadataSpec(metadataSpecId, callback, retry_policy, cancellation_token)
    assert(metadataSpecId)

    local url_path = "/metadata_spec/{metadataSpecId}"
    url_path = url_path:gsub("{metadataSpecId}", uri.encode(tostring(metadataSpecId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Metadata Editor Schema
-- Gets a specific Metadata Editor Schema backed by the supplied MetadataSpec by name.
-- @path /metadata_spec/{metadataSpecName}/editor.json
-- @name getEditorSchema
-- @param metadataSpecName (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getEditorSchema(metadataSpecName, callback, retry_policy, cancellation_token)
    assert(metadataSpecName)

    local url_path = "/metadata_spec/{metadataSpecName}/editor.json"
    url_path = url_path:gsub("{metadataSpecName}", uri.encode(tostring(metadataSpecName)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific JSON Schema
-- Gets a specific JSON Schema backed by the supplied MetadataSpec by name.
-- @path /metadata_spec/{metadataSpecName}/schema.json
-- @name getJsonSchema
-- @param metadataSpecName (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getJsonSchema(metadataSpecName, callback, retry_policy, cancellation_token)
    assert(metadataSpecName)

    local url_path = "/metadata_spec/{metadataSpecName}/schema.json"
    url_path = url_path:gsub("{metadataSpecName}", uri.encode(tostring(metadataSpecName)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a specific Metadata Spec
-- Gets a specific MetadataSpec by name or Id.
-- @path /metadata_spec/{metadataSpecNameOrId}
-- @name getMetadataSpec
-- @param metadataSpecNameOrId (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getMetadataSpec(metadataSpecNameOrId, callback, retry_policy, cancellation_token)
    assert(metadataSpecNameOrId)

    local url_path = "/metadata_spec/{metadataSpecNameOrId}"
    url_path = url_path:gsub("{metadataSpecNameOrId}", uri.encode(tostring(metadataSpecNameOrId)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Mock Session
-- Begins a session by accepting a mock session request.  The request must be made with an authenticated super-user.
-- @path /mock_session
-- @name createMockSession
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createMockSession(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/mock_session"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Destroys the Session
-- 
-- @path /session/{sessionSecret}
-- @name blacklistSession
-- @param sessionSecret (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.blacklistSession(sessionSecret, callback, retry_policy, cancellation_token)
    assert(sessionSecret)

    local url_path = "/session/{sessionSecret}"
    url_path = url_path:gsub("{sessionSecret}", uri.encode(tostring(sessionSecret)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a Session
-- Begins a session by accepting both the UserID and the Passoword.  Upon successful completion of this call, the user will be added to the current HTTP session.  If the session expires, the user will have to reestablish the session by supplying credentials again.  This is most useful for applications delivered in a web page.
-- @path /session
-- @name createUsernamePasswordSession
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createUsernamePasswordSession(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/session"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets the status of all applications.
-- 
-- @path /elements/application
-- @name getAllApplicationStatuses
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAllApplicationStatuses(callback, retry_policy, cancellation_token)

    local url_path = "/elements/application"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Performs the health check.
-- Performs the health check for the server. What this actually does is deployment and implementation specific. However, any successful response code should indicate that the service is capable of servicing requests. Any unsuccessful error codes should indicate that the instance has internal issues and should be taken offline.
-- @path /health
-- @name getServerHealth
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getServerHealth(callback, retry_policy, cancellation_token)

    local url_path = "/health"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets the status of all applications.
-- 
-- @path /elements/system
-- @name getAllInstalledElements
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getAllInstalledElements(callback, retry_policy, cancellation_token)

    local url_path = "/elements/system"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Show Server Version Information
-- Returns information about the current server version.  This should always return theversion metadata.  This information is only known in packaged releases.
-- @path /version
-- @name getVersion
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getVersion(callback, retry_policy, cancellation_token)

    local url_path = "/version"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Sign Up a User
-- Supplying the user create request object, this will create a new user.
-- @path /signup
-- @name signUpUser
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.signUpUser(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/signup"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Search Users
-- Searches all users in the system and returning the metadata for all matches against the given search filter.
-- @path /user
-- @name getUsers
-- @param offset 
-- @param count 
-- @param search 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getUsers(offset, count, search, callback, retry_policy, cancellation_token)

    local url_path = "/user"

    local query_params = {}
    query_params["offset"] = offset
    query_params["count"] = count
    query_params["search"] = search

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Creates a User
-- Supplying the user object, this will update the user with the new information supplied in the body of the request.  Optionally, the user&#x27;s password may be provided in the User object.
-- @path /user
-- @name createUser
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.createUser(body, callback, retry_policy, cancellation_token)
    assert(body)

    local url_path = "/user"

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "POST", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets a Specific User
-- Gets a specific user by name, email, or unique user ID.
-- @path /user/{name}
-- @name getUser
-- @param name (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getUser(name, callback, retry_policy, cancellation_token)
    assert(name)

    local url_path = "/user/{name}"
    url_path = url_path:gsub("{name}", uri.encode(tostring(name)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Deletes a User
-- Deletes and permanently removes the user from the server.  The server may keep some metadata as necessary to avoid data inconsistency.  However, the user has been deleted from the client standpoint and will not be accessible through any of the existing APIs.
-- @path /user/{name}
-- @name deactivateUser
-- @param name (REQUIRED) 
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.deactivateUser(name, callback, retry_policy, cancellation_token)
    assert(name)

    local url_path = "/user/{name}"
    url_path = url_path:gsub("{name}", uri.encode(tostring(name)))

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "DELETE", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Gets the current User
-- A special endpoint used to get the current user for the request.  The current user is typically associated with the session but may be derived any other way.  This is essentially an alias for using GET /user/myUserId
-- @path /user/me
-- @name getCurrentUser
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.getCurrentUser(callback, retry_policy, cancellation_token)

    local url_path = "/user/me"

    local query_params = {}

    local post_data = nil

    local headers = {}

    return http(callback, url_path, query_params, "GET", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a User
-- Supplying the user object, this will update the user with the new information supplied in the body of the request.  Optionally, the user&#x27;s password may be provided in the User object.
-- @path /user/{userId}
-- @name updateUser
-- @param userId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateUser(userId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(userId)

    local url_path = "/user/{userId}"
    url_path = url_path:gsub("{userId}", uri.encode(tostring(userId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

--- Updates a User&#x27;s Password
-- Supplying the UserUpdatePasswordRequest, this will attempt to update the user&#x27;s password only if they supply the correct existing password.
-- @path /user/{userId}/password
-- @name updateUserPassword
-- @param userId (REQUIRED) 
-- @param body
-- @param callback
-- @param retry_policy
-- @param cancellation_token
function M.updateUserPassword(userId, body, callback, retry_policy, cancellation_token)
    assert(body)
    assert(userId)

    local url_path = "/user/{userId}/password"
    url_path = url_path:gsub("{userId}", uri.encode(tostring(userId)))

    local query_params = {}

    local post_data = json.encode(body)

    local headers = {}
    headers["Content-Type"] = "application/json"

    return http(callback, url_path, query_params, "PUT", headers, post_data, retry_policy, cancellation_token, function(result, err)
        return result, err
    end)
end

return M