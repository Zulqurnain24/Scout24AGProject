//
//  String+Utils.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

extension String {
    
    func localized(fromTable table: String) -> String {
        return NSLocalizedString(self, tableName: table, value: "ERROR FOR STRING: \"\(self)\"", comment: "")
    }
    
    mutating func append(string: String) {
        if self.count > 0 {
            self += " and \(string)"
        } else {
            self = string
        }
    }

}
