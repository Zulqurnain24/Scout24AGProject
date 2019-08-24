//
//  SpacingRule.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum SpacingRule: CGFloat {
    
    case leftMargin
    case topMargin
    case rightMargin
    case bottomMargin
    
    case lessWideLeftMargin
    case lessWideRightMargin
    case lessWideTopMargin
    case lesssWideBottomMargin
    
    case wideLeftMargin
    case wideRightMargin
    
    case leftPadding
    case topPadding
    case rightPadding
    case bottomPadding
    
    var value: CGFloat {
        switch self {
        case .leftMargin: return 15
        case .topMargin: return 15
        case .rightMargin: return -15
        case .bottomMargin: return -15
            
        case .lessWideLeftMargin: return 30
        case .lessWideTopMargin: return 30
        case .lessWideRightMargin: return -30
        case .lesssWideBottomMargin: return -30
            
        case .wideLeftMargin: return 40
        case .wideRightMargin: return -40
            
        case .leftPadding: return 10
        case .topPadding: return 10
        case .rightPadding: return -10
        case .bottomPadding: return -10
        }
    }
    
}
