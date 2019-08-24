//
//  PropertyDetail.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

enum PropertyDetail: String {

    case propertyDetailViewControllerTitle = "PROPERTY_DETAIL_VIEW_CONTROLLER_TITLE"
    case titleLabel = "TITLE_LABEL"
    case priceLabel = "PRICE_LABEL"
    case showOnMap = "SHOW_ON_MAP"
    case dataFetchError = "DATA_FETCH_ERROR"
    
}

extension PropertyDetail: StringLocalizable {
    
    var localized: String {
        return self.rawValue.localized(fromTable: "\(type(of: self))")
    }
    
}
