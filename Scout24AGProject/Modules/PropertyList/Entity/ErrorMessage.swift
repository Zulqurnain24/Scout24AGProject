//
//  ErrorMessage.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

struct ErrorMessage: Codable {

    var status: Int
    var errorCode: String
    var errorMessage: String
    var errorSummary: String
    
    private enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case errorSummary = "error_summary"
        
    }
    
}
