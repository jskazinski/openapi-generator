//
// UserAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import Vapor
#if canImport(AnyCodable)
import AnyCodable
#endif

open class UserAPI {

    /**
     Create user
     POST /user
     This can only be done by the logged in user.
     - parameter body: (body) Created user object 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func createUserRaw(body: User, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        let localVariablePath = "/user"
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.POST, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            try localVariableRequest.content.encode(body, using: Configuration.contentConfiguration.requireEncoder(for: User.defaultContentType))
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum CreateUser {
        case http0(raw: ClientResponse)
    }

    /**
     Create user
     POST /user
     This can only be done by the logged in user.
     - parameter body: (body) Created user object 
     - returns: `EventLoopFuture` of `CreateUser` 
     */
    open class func createUser(body: User, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<CreateUser> {
        return createUserRaw(body: body, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> CreateUser in
            switch response.status.code {
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Creates list of users with given input array
     POST /user/createWithArray
     - parameter body: (body) List of user object 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func createUsersWithArrayInputRaw(body: [User], headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        let localVariablePath = "/user/createWithArray"
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.POST, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            try localVariableRequest.content.encode(body, using: Configuration.contentConfiguration.requireEncoder(for: [User].defaultContentType))
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum CreateUsersWithArrayInput {
        case http0(raw: ClientResponse)
    }

    /**
     Creates list of users with given input array
     POST /user/createWithArray
     - parameter body: (body) List of user object 
     - returns: `EventLoopFuture` of `CreateUsersWithArrayInput` 
     */
    open class func createUsersWithArrayInput(body: [User], headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<CreateUsersWithArrayInput> {
        return createUsersWithArrayInputRaw(body: body, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> CreateUsersWithArrayInput in
            switch response.status.code {
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Creates list of users with given input array
     POST /user/createWithList
     - parameter body: (body) List of user object 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func createUsersWithListInputRaw(body: [User], headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        let localVariablePath = "/user/createWithList"
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.POST, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            try localVariableRequest.content.encode(body, using: Configuration.contentConfiguration.requireEncoder(for: [User].defaultContentType))
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum CreateUsersWithListInput {
        case http0(raw: ClientResponse)
    }

    /**
     Creates list of users with given input array
     POST /user/createWithList
     - parameter body: (body) List of user object 
     - returns: `EventLoopFuture` of `CreateUsersWithListInput` 
     */
    open class func createUsersWithListInput(body: [User], headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<CreateUsersWithListInput> {
        return createUsersWithListInputRaw(body: body, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> CreateUsersWithListInput in
            switch response.status.code {
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Delete user
     DELETE /user/{username}
     This can only be done by the logged in user.
     - parameter username: (path) The name that needs to be deleted 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func deleteUserRaw(username: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        var localVariablePath = "/user/{username}"
        let usernamePreEscape = String(describing: username)
        let usernamePostEscape = usernamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{username}", with: usernamePostEscape, options: .literal, range: nil)
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.DELETE, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum DeleteUser {
        case http400(raw: ClientResponse)
        case http404(raw: ClientResponse)
        case http0(raw: ClientResponse)
    }

    /**
     Delete user
     DELETE /user/{username}
     This can only be done by the logged in user.
     - parameter username: (path) The name that needs to be deleted 
     - returns: `EventLoopFuture` of `DeleteUser` 
     */
    open class func deleteUser(username: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<DeleteUser> {
        return deleteUserRaw(username: username, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> DeleteUser in
            switch response.status.code {
            case 400:
                return .http400(raw: response)
            case 404:
                return .http404(raw: response)
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Get user by user name
     GET /user/{username}
     - parameter username: (path) The name that needs to be fetched. Use user1 for testing. 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func getUserByNameRaw(username: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        var localVariablePath = "/user/{username}"
        let usernamePreEscape = String(describing: username)
        let usernamePostEscape = usernamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{username}", with: usernamePostEscape, options: .literal, range: nil)
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.GET, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum GetUserByName {
        case http200(value: User, raw: ClientResponse)
        case http400(raw: ClientResponse)
        case http404(raw: ClientResponse)
        case http0(raw: ClientResponse)
    }

    /**
     Get user by user name
     GET /user/{username}
     - parameter username: (path) The name that needs to be fetched. Use user1 for testing. 
     - returns: `EventLoopFuture` of `GetUserByName` 
     */
    open class func getUserByName(username: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<GetUserByName> {
        return getUserByNameRaw(username: username, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> GetUserByName in
            switch response.status.code {
            case 200:
                return .http200(value: try response.content.decode(User.self, using: Configuration.contentConfiguration.requireDecoder(for: User.defaultContentType)), raw: response)
            case 400:
                return .http400(raw: response)
            case 404:
                return .http404(raw: response)
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Logs user into the system
     GET /user/login
     - responseHeaders: [X-Rate-Limit(Int), X-Expires-After(Date)]
     - parameter username: (query) The user name for login 
     - parameter password: (query) The password for login in clear text 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func loginUserRaw(username: String, password: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        let localVariablePath = "/user/login"
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.GET, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            struct QueryParams: Content {
                var username: String
                var password: String

                enum CodingKeys: String, CodingKey {
                    case username = "username"
                    case password = "password"
                }
            }
            try localVariableRequest.query.encode(QueryParams(username: username, password: password))
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum LoginUser {
        case http200(value: String, raw: ClientResponse)
        case http400(raw: ClientResponse)
        case http0(raw: ClientResponse)
    }

    /**
     Logs user into the system
     GET /user/login
     - responseHeaders: [X-Rate-Limit(Int), X-Expires-After(Date)]
     - parameter username: (query) The user name for login 
     - parameter password: (query) The password for login in clear text 
     - returns: `EventLoopFuture` of `LoginUser` 
     */
    open class func loginUser(username: String, password: String, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<LoginUser> {
        return loginUserRaw(username: username, password: password, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> LoginUser in
            switch response.status.code {
            case 200:
                return .http200(value: try response.content.decode(String.self, using: Configuration.contentConfiguration.requireDecoder(for: String.defaultContentType)), raw: response)
            case 400:
                return .http400(raw: response)
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Logs out current logged in user session
     GET /user/logout
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func logoutUserRaw(headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        let localVariablePath = "/user/logout"
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.GET, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum LogoutUser {
        case http0(raw: ClientResponse)
    }

    /**
     Logs out current logged in user session
     GET /user/logout
     - returns: `EventLoopFuture` of `LogoutUser` 
     */
    open class func logoutUser(headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<LogoutUser> {
        return logoutUserRaw(headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> LogoutUser in
            switch response.status.code {
            default:
                return .http0(raw: response)
            }
        }
    }

    /**
     Updated user
     PUT /user/{username}
     This can only be done by the logged in user.
     - parameter username: (path) name that need to be deleted 
     - parameter body: (body) Updated user object 
     - returns: `EventLoopFuture` of `ClientResponse` 
     */
    open class func updateUserRaw(username: String, body: User, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<ClientResponse> {
        var localVariablePath = "/user/{username}"
        let usernamePreEscape = String(describing: username)
        let usernamePostEscape = usernamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{username}", with: usernamePostEscape, options: .literal, range: nil)
        let localVariableURLString = PetstoreClientAPI.basePath + localVariablePath

        guard let localVariableApiClient = Configuration.apiClient else {
            fatalError("Configuration.apiClient is not set.")
        }

        return localVariableApiClient.send(.PUT, headers: headers, to: URI(string: localVariableURLString)) { localVariableRequest in
            try Configuration.apiWrapper(&localVariableRequest)
            
            
            try localVariableRequest.content.encode(body, using: Configuration.contentConfiguration.requireEncoder(for: User.defaultContentType))
            
            try beforeSend(&localVariableRequest)
        }
    }

    public enum UpdateUser {
        case http400(raw: ClientResponse)
        case http404(raw: ClientResponse)
        case http0(raw: ClientResponse)
    }

    /**
     Updated user
     PUT /user/{username}
     This can only be done by the logged in user.
     - parameter username: (path) name that need to be deleted 
     - parameter body: (body) Updated user object 
     - returns: `EventLoopFuture` of `UpdateUser` 
     */
    open class func updateUser(username: String, body: User, headers: HTTPHeaders = PetstoreClientAPI.customHeaders, beforeSend: (inout ClientRequest) throws -> () = { _ in }) -> EventLoopFuture<UpdateUser> {
        return updateUserRaw(username: username, body: body, headers: headers, beforeSend: beforeSend).flatMapThrowing { response -> UpdateUser in
            switch response.status.code {
            case 400:
                return .http400(raw: response)
            case 404:
                return .http404(raw: response)
            default:
                return .http0(raw: response)
            }
        }
    }
}