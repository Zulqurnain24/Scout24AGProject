//
//  SplashScreen.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum SplashScreen: String {

    case viewControllerTitle = "SPLASH_SCREEN_TITLE"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension SplashScreen: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
