//
//  PropertyListEndpoint.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Alamofire

enum PropertyListEndpoint {
    
    case propertyList
    
}

// MARK: - PropertyListEndpoint extension

extension PropertyListEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .propertyList: return "/realestates"
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .propertyList: return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .propertyList: return .get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        default: return ["Content-Type": "application/json;"]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURL)
        var urlRequest = URLRequest(url: url!.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        let encoding = Alamofire.URLEncoding.default
        return try encoding.encode(urlRequest, with: parameters)
    }
    
}

