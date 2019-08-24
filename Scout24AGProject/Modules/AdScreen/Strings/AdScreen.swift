//
//  AdScreen.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum AdScreen: String {
    
    case viewControllerTitle = "AD_SCREEN_TITLE"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension AdScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}

