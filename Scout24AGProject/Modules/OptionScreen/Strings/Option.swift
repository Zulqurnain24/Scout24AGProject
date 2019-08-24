//
//  OptionScreen.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum NewsDetail: String {
    
    case newsOverviewSectionPrimaryTitle = "NEWS_DETAIL_SECTION_HEADER_PRIMARY_TITLE"
    case newsOverviewViewControllerTitle = "NEWS_DETAIL_VIEW_CONTROLLER_TITLE"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension NewsDetail: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
