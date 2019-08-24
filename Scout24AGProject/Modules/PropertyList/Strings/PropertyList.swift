//
//  SplashScreen.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum PropertyList: String {

    case viewControllerTitle = "PROPERTY_LIST_SCREEN_TITLE"
    case propertyTitle = "PROPERTY_TITLE"
    case propertyCellTitle = "PROPERTY_LIST_SCREEN_CELL_TITLE"
    case propertyCellPrice = "PROPERTY_LIST_SCREEN_CELL_PRICE"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension PropertyList: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
