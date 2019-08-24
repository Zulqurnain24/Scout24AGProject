//
//  Typography.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum Typography {
    
    case titleXL
    case titleLarge
    case titleMedium
    case titleSmall
    case titleXS
    
    case titleItalics
    case headlineXXXXL
    case headlineXXXL
    case headlineXXL
    case headlineXL
    case headlineLarge
    case headlineMedium
    case headline
    case headlineSmall
    case headlineXS
    case bodyThin
    case bodyHeader
    case bodyXXL
    case bodyXL
    case bodyLarge
    case bodySemiLarge
    case bodyMedium
    case bodySemiMedium
    case body
    case bodySmall
    case bodyXS
    
    case bodyItalic
    case bodyXXLSemibold
    case bodyXLSemibold
    case bodyLargeSemibold
    case bodyMediumSemibold
    case bodySemibold
    case bodySmallSemibold
    case bodyXSSemibold
    
    case bodyXXLBold
    case bodyXLBold
    case bodyLargeBold
    case bodyMediumBold
    case bodyBold
    case bodySmallBold
    case bodyXSBold
    case buttonLarge
    case buttonSmall
    case buttonXL
    case buttonXS
    case tutorialHeader
    
    case fancyXL
    case fancyLarge
    
    case brush
    case brushSmall
    case brushXS
    case brushXXS
    
    case menuItem
    case menuItemXS
    case selectedMenuItem
    case selectedMenuItemXS
    
    case brandHeader
    
    var font: UIFont? {
        switch self {
        case .titleXL: return UIFont(name: "Gilroy-ExtraBold", size: 34)
        case .titleLarge: return UIFont(name: "Gilroy-ExtraBold", size: 28)
        case .titleMedium: return UIFont(name: "Gilroy-ExtraBold", size: 24)
        case .titleSmall: return UIFont(name: "Gilroy-ExtraBold", size: 20)
        case .titleXS: return UIFont(name: "Gilroy-ExtraBold", size: 16)
            
        case .titleItalics: return UIFont(name: "PlayfairDisplay-BoldItalic", size: 24)
			// do we still need this?
           
        case .headlineXXXXL: return UIFont(name: "PlayfairDisplay-BoldItalic", size: 45)
        case .headlineXXXL: return UIFont(name: "Gilroy-ExtraBold", size: 28)
        case .headlineXXL: return UIFont(name: "Gilroy-ExtraBold", size: 22)
        case .headlineXL: return UIFont(name: "Gilroy-ExtraBold", size: 20)
        case .headlineLarge: return UIFont(name: "Gilroy-ExtraBold", size: 18)
        case .headlineMedium: return UIFont(name: "Gilroy-ExtraBold", size: 16)
        case .headline: return UIFont(name: "Gilroy-ExtraBold", size: 14)
        case .headlineSmall: return UIFont(name: "Gilroy-ExtraBold", size: 12)
        case .headlineXS: return UIFont(name: "Gilroy-ExtraBold", size: 10)
        
        case .bodyThin: return UIFont.systemFont(ofSize: 48, weight: .thin)
        case .bodyHeader: return UIFont.systemFont(ofSize: 48, weight: .bold)
        case .bodyXXL: return UIFont.systemFont(ofSize: 24, weight: .regular)
        case .bodyXL: return UIFont.systemFont(ofSize: 20, weight: .regular)
        case .bodyLarge: return UIFont.systemFont(ofSize: 18, weight: .regular)
        case .bodySemiLarge: return UIFont.systemFont(ofSize: 17, weight: .regular)
        case .bodyMedium: return UIFont.systemFont(ofSize: 16, weight: .regular)
        case .bodySemiMedium: return UIFont.systemFont(ofSize: 15, weight: .regular)
        case .body: return UIFont.systemFont(ofSize: 14, weight: .regular)
        case .bodySmall: return UIFont.systemFont(ofSize: 12, weight: .regular)
        case .bodyXS: return UIFont.systemFont(ofSize: 10, weight: .regular)
		case .bodyItalic: return UIFont(name: "Lato-Italic", size: 14)
        
        case .bodyXXLBold: return UIFont.systemFont(ofSize: 24, weight: .bold)
        case .bodyXLBold: return UIFont.systemFont(ofSize: 20, weight: .bold)
        case .bodyLargeBold: return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .bodyMediumBold: return UIFont.systemFont(ofSize: 16, weight: .bold)
        case .bodyBold: return UIFont.systemFont(ofSize: 14, weight: .bold)
        case .bodySmallBold: return UIFont.systemFont(ofSize: 12, weight: .bold)
        case .bodyXSBold: return UIFont.systemFont(ofSize: 10, weight: .bold)
            
        case .bodyXXLSemibold: return UIFont.systemFont(ofSize: 24, weight: .semibold)
        case .bodyXLSemibold: return UIFont.systemFont(ofSize: 20, weight: .semibold)
        case .bodyLargeSemibold: return UIFont.systemFont(ofSize: 18, weight: .semibold)
        case .bodyMediumSemibold: return UIFont.systemFont(ofSize: 16, weight: .semibold)
        case .bodySemibold: return UIFont.systemFont(ofSize: 14, weight: .semibold)
        case .bodySmallSemibold: return UIFont.systemFont(ofSize: 12, weight: .semibold)
        case .bodyXSSemibold: return UIFont.systemFont(ofSize: 10, weight: .semibold)
            
        case .buttonLarge: return UIFont.systemFont(ofSize: 16, weight: .regular)
        case .buttonSmall: return UIFont.systemFont(ofSize: 14, weight: .regular)
        case .buttonXL: return UIFont.systemFont(ofSize: 20, weight: .regular)
        case .buttonXS: return UIFont.systemFont(ofSize: 12, weight: .regular)
            
        case .tutorialHeader: return UIFont(name: "Gilroy-ExtraBold", size: 48)
            
        case .fancyXL: return UIFont(name: "BroadcastMatter", size: 110)
        case .fancyLarge: return UIFont(name: "BroadcastMatter", size: 94)
            
        case .brush: return UIFont(name: "Billy Ohio", size: 80)
        case .brushSmall: return UIFont(name: "Billy Ohio", size: 64)
        case .brushXS: return UIFont(name: "Billy Ohio", size: 48)
        case .brushXXS: return UIFont(name: "Billy Ohio", size: 38)
            
        case .menuItem: return UIFont(name: "Gilroy-Regular", size: 14)
        case .menuItemXS: return UIFont(name: "Gilroy-Regular", size: 10)
        case .selectedMenuItem: return UIFont(name: "Gilroy-Bold", size: 14)
        case .selectedMenuItemXS: return UIFont(name: "Gilroy-Bold", size: 10)
            
        case .brandHeader: return UIFont(name: "Gilroy-Bold", size: 12)

        }
        
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .titleXL: return CGFloat(38)
        case .titleLarge: return CGFloat(36)
        case .titleMedium: return CGFloat(32)
        case .titleSmall: return CGFloat(28)
        case .titleXS: return CGFloat(22)
            
        case .titleItalics: return CGFloat(32)
            
        case .headlineXXXL: return CGFloat(32)
        case .headlineXXL: return CGFloat(29)
        case .headlineXL: return CGFloat(28)
        case .headlineLarge: return CGFloat(24)
        case .headlineMedium: return CGFloat(22)
        case .headline: return CGFloat(18)
        case .headlineSmall: return CGFloat(16)
        case .headlineXS: return CGFloat(12)
            
        case .bodyThin: return CGFloat(50)
        case .bodyHeader: return CGFloat(55)
        case .bodyXXL: return CGFloat(32)
        case .bodyXL: return CGFloat(28)
        case .bodyLarge: return CGFloat(24)
        case .bodySemiLarge: return CGFloat(22)
        case .bodyMedium: return CGFloat(20)
        case .bodySemiMedium: return CGFloat(19)
        case .body: return CGFloat(18)
        case .bodySmall: return CGFloat(16)
        case .bodyXS: return CGFloat(12)
            
        case .bodyItalic: return CGFloat(18)
        case .bodyXXLSemibold: return CGFloat(32)
        case .bodyXLSemibold: return CGFloat(28)
        case .bodyLargeSemibold: return CGFloat(24)
        case .bodyMediumSemibold: return CGFloat(20)
        case .bodySemibold: return CGFloat(18)
        case .bodySmallSemibold: return CGFloat(16)
        case .bodyXSSemibold: return CGFloat(12)
            
        case .bodyXXLBold: return CGFloat(32)
        case .bodyXLBold: return CGFloat(28)
        case .bodyLargeBold: return CGFloat(24)
        case .bodyMediumBold: return CGFloat(20)
        case .bodyBold: return CGFloat(18)
        case .bodySmallBold: return CGFloat(16)
        case .bodyXSBold: return CGFloat(12)
            
        case .buttonLarge: return CGFloat(24)
        case .buttonSmall: return CGFloat(18)
        case .buttonXL: return CGFloat(28)
        case .buttonXS: return CGFloat(16)
            
        case .tutorialHeader: return CGFloat(48)
            
        case .fancyXL: return CGFloat(118)
        case .fancyLarge: return CGFloat(94)
            
        case .brush: return CGFloat(110)
        case .brushSmall: return CGFloat(94)
        case .brushXS: return CGFloat(80)
        case .brushXXS: return CGFloat(64)
            
        case .menuItem: return CGFloat(16)
        case .menuItemXS: return CGFloat(12)
        case .selectedMenuItem: return CGFloat(16)
        case .selectedMenuItemXS: return CGFloat(12)
            
        case .brandHeader: return CGFloat(14)
        case .headlineXXXXL: return CGFloat(45)
        }
        
    }
    
}
