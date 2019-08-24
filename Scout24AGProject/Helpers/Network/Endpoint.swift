//
//  Endpoint.swift
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Alamofire

protocol Endpoint: URLRequestConvertible {
    
    var baseURL: String { get }
    var path: String { get }
    var url: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var body: Parameters { get }
    var headers: HTTPHeaders { get }
    
}

extension Endpoint {
    
    var baseURL: String {
        guard let baseUrl = Configuration.shared.environment?.baseURL else { return "" }
        return baseUrl
    }
    
    var encoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    var url: String {
        return baseURL + path
    }
    
    var body: Parameters {
        return Parameters()
    }
    
}
