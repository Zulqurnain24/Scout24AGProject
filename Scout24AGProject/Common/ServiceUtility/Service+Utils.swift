//
//  Service+Utils.swift
//  Scout24AGProject
//
//  Created by Zulqurnain on 01/19/19.

import Alamofire
import Foundation
import Freddy

enum Result<T> {
    
    case success(T)
    case failure(error: Error)
    
}

enum ServiceResult<T> {
    
    case success(responseObject: T)
    case failure(error: String)
    
}

enum EmptyResult {
    
    case success
    case failure(error: String)
    
}

enum ErrorType: String {
    
    case reachability = "REACHABILITY_ERROR"
    case alamoFire = "ALAMOFIRE_ERROR"
    case urlError = "URL_ERROR"
    case errorResponse = "ERROR_RESPONSE"
    case objectMapping = "OBJECT_MAPPING_ERROR"
    case unknownError = "UNKNOWN_ERROR"
    case unAuthenticatedUser = "UNAUTHENTICATED_USER_ERROR"
    
}

enum Scout24AGProjectError: Error {
    
    case network(error: Error)
    case failure(error: Error?)
    case unknownError(String)
    case unAuthenticatedUser(String)
    
    case objectMappingError(error: Error)
    case alamoFireError(String)
    case urlError(String)
    
    var errorType: ErrorType {
        switch self {
        case .network: return .reachability
        case .failure: return .errorResponse
            
        case .objectMappingError: return .objectMapping
        case .alamoFireError: return .alamoFire
        case .urlError: return .urlError
        default: return .unknownError
        }
    }
}

protocol NetworkResponseHandler {
    
    func parseError(response: DataResponse<Any>) -> Scout24AGProjectError?
    func verifyStatusCode(in response: DataResponse<Any>) -> Bool
    
}

extension NetworkResponseHandler {
    
    func verifyStatusCode(in response: DataResponse<Any>) -> Bool {
        guard let statusCode = response.response?.statusCode, (200..<300).contains(statusCode) else {
            return false
        }
        return true
    }
    
    func parseError(response: DataResponse<Any>) -> Scout24AGProjectError? {
        guard case let .failure(error) = response.result else {
            return Scout24AGProjectError.failure(error: response.result.error!)
        }
        
        var failureError: Scout24AGProjectError?
        
        if let error = error as? AFError {
            switch error {
            case .invalidURL(let url):
                failureError = Scout24AGProjectError.alamoFireError("Invalid URL: \(url) - \(error.localizedDescription)")
            case .parameterEncodingFailed(let reason):
                failureError = Scout24AGProjectError.alamoFireError("Parameter encoding failed: \(error.localizedDescription) Failure Reason: \(reason)")
            case .multipartEncodingFailed(let reason):
                failureError = Scout24AGProjectError.alamoFireError("Multipart encoding failed: \(error.localizedDescription) Failure Reason: \(reason)")
            case .responseValidationFailed(let reason):
                switch reason {
                case .dataFileNil, .dataFileReadFailed:
                    failureError = Scout24AGProjectError.alamoFireError("Downloaded file could not be read")
                case .missingContentType(let acceptableContentTypes):
                    failureError = Scout24AGProjectError.alamoFireError("Content Type Missing: \(acceptableContentTypes)")
                case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                    failureError = Scout24AGProjectError.alamoFireError("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                case .unacceptableStatusCode(let code):
                    failureError = Scout24AGProjectError.alamoFireError("Response status code was unacceptable: \(code)")
                }
            case .responseSerializationFailed(let reason):
                failureError = Scout24AGProjectError.alamoFireError("Response serialization failed: \(error.localizedDescription) Failure Reason: \(reason)")
            }
        } else if let error = error as? URLError {
            failureError = Scout24AGProjectError.urlError("URLError occurred: \(error)")
        } else {
            failureError = Scout24AGProjectError.unknownError("Unknown error: \(error)")
        }
        
        return failureError
    }
    
}

extension DataRequest {
    
    static func jsonResponseSerializer() -> DataResponseSerializer<JSON> {
        return DataResponseSerializer(serializeResponse: { (_, response, data, error) in
            guard error == nil else {
                return .failure(Scout24AGProjectError.failure(error: error))
            }
            
            guard let statusCode = response?.statusCode, (200..<300).contains(statusCode) else {
                return .failure(Scout24AGProjectError.failure(error: error))
            }
            
            let result = Request.serializeResponseData(response: response, data: data, error: error)
            
            guard case .success = result else {
                return .failure(Scout24AGProjectError.failure(error: error))
            }
            
            do {
                let json = try JSON(data: result.value!)
                return .success(json)
            } catch let error {
                return .failure(Scout24AGProjectError.failure(error: error))
            }
        })
    }
    
    @discardableResult
    func scout24AGProjectResponseJSON(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<JSON>) -> Void) -> Self {
        return validate(statusCode: 200..<300)
            .validate(contentType: ["application/json; charset=UTF-8"]).response(queue: queue, responseSerializer: DataRequest.jsonResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func scout24AGProjectResponseData(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Data>) -> Void) -> Self {
        return validate(statusCode: 200..<300).validate(contentType: ["application/json; charset=UTF-8"]).responseData(queue: queue, completionHandler: completionHandler)
    }
    
}
