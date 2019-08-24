//
//  Palette.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

enum Palette {
    
    case black
    case blue
    case blueBorder
    case clear
    case cobaltBlue
    case darkPurple
    case error
    case gold
    case gray1
    case gray2
    case gray3
    case gray4
    case gray5
    case green
    case green2
    case lightPurple
    case orange
    case pink
    case purple
    case raspberry
    case red
    case rose
    case success
    case teal
    case white
    case magenta

    var color: UIColor {
        switch self {
        case .black: return UIColor.rgb(red: 0, green: 0, blue: 0)
        case .blue: return UIColor.rgb(red: 0, green: 122, blue: 255)
        case .blueBorder: return UIColor.rgb(red: 0, green: 112, blue: 235)
        case .clear: return UIColor.clear
        case .cobaltBlue: return UIColor.rgb(red: 56, green: 84, blue: 143)
        case .darkPurple: return UIColor.rgb(red: 48, green: 35, blue: 174)
        case .error: return UIColor.rgb(red: 218, green: 54, blue: 22)
        case .gold: return UIColor.rgb(red: 223, green: 201, blue: 136)
        case .gray1: return UIColor.rgb(red: 242, green: 242, blue: 242)
        case .gray2: return UIColor.rgb(red: 204, green: 204, blue: 204)
        case .gray3: return UIColor.rgb(red: 143, green: 143, blue: 143)
        case .gray4: return UIColor.rgb(red: 100, green: 100, blue: 100)
        case .gray5: return UIColor.rgb(red: 51, green: 51, blue: 51)
        case .green: return UIColor.rgb(red: 30, green: 241, blue: 161)
        case .green2: return UIColor.rgb(red: 0, green: 240, blue: 161)
        case .lightPurple: return UIColor.rgb(red: 200, green: 109, blue: 215)
        case .orange: return UIColor.rgb(red: 244, green: 147, blue: 66)
        case .purple: return UIColor.rgb(red: 130, green: 67, blue: 213)
        case .raspberry: return UIColor.rgb(red: 211, green: 54, blue: 122)
        case .red: return UIColor.rgb(red: 255, green: 0, blue: 0)
        case .rose: return UIColor.rgb(red: 226, green: 123, blue: 139)
        case .success: return UIColor.rgb(red: 80, green: 184, blue: 60)
        case .teal: return UIColor.rgb(red: 0, green: 175, blue: 205)
        case .white: return UIColor.rgb(red: 255, green: 255, blue: 255)
        case .magenta: return UIColor.rgb(red: 238, green: 35, blue: 86)
        case .pink: return UIColor(red: 0.93, green: 0.14, blue: 0.34, alpha: 1)
        }
    }
    
}
