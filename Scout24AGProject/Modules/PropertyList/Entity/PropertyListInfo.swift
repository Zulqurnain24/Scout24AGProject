//
//  PropertyListInfo.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Freddy

struct PropertyListInfo {
    
    var propertyRecordsArray: [PropertyListRecord]
    
    init(propertyRecordsArray: [PropertyListRecord]) {
        self.propertyRecordsArray = propertyRecordsArray
    }
    
    func extractNewsRecord() -> [PropertyListRecord] {
        var propertyRecordsArray = [PropertyListRecord]()
        for propertyRecord in propertyRecordsArray {
            propertyRecordsArray.append(propertyRecord)
        }
        return propertyRecordsArray
    }
    
}

extension PropertyListInfo: JSONDecodable {
    
    init(json: JSON) throws {
        let jsonNewsRecordsArray = try json.getArray()
        
        propertyRecordsArray = try jsonNewsRecordsArray.map { (json) in
            return try PropertyListRecord(json: json)
        }
    }
    
}


