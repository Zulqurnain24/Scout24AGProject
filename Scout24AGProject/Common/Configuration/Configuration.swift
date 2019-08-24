//
//  Configuration.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum Environment: String {
    
    case scoutpropertyApi
    
    var baseURL: String {
        switch self {
        case .scoutpropertyApi: return "http://private-91146-mobiletask.apiary-mock.com"
        }
    }
}

struct Configuration {
    
    static let shared = Configuration()
    
    var environment: Environment? {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            switch configuration {
            case "Debug": return .scoutpropertyApi
            default: return nil
            }
        }
        return nil
    }
}

