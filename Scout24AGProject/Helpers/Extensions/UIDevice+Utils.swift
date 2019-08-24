//
//  UIDevice+Utils.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import LocalAuthentication

public enum DeviceModel: String {
    case simulator   = "simulator",
    iPod1            = "ipod1",
    iPod2            = "ipod2",
    iPod3            = "ipod3",
    iPod4            = "ipod4",
    iPod5            = "ipod5",
    iPad2            = "ipad2",
    iPad3            = "ipad3",
    iPad4            = "ipad4",
    iPhone4          = "iphone4",
    iPhone4S         = "iphone4s",
    iPhone5          = "iphone5",
    iPhone5S         = "iphone5s",
    iPhone5C         = "iphone5c",
    iPadMini1        = "ipadmini1",
    iPadMini2        = "ipadmini2",
    iPadMini3        = "ipadmini3",
    iPadAir1         = "ipadair1",
    iPadAir2         = "ipadair2",
    iPadPro97        = "ipadpro9.7\"",
    iPadPro97cell    = "ipadpro9.7\"cellular",
    iPad5            = "ipad5",
    iPadPro105       = "ipadpro10.5\"",
    iPadPro105cell   = "ipadpro10.5\"cellular",
    iPadPro129       = "ipadpro12.9\"",
    iPadPro129cell   = "ipadpro12.9\"cellular",
    iPadPro2129      = "ipadpro2_12.9\"",
    iPadPro2129cell  = "ipadpro2_12.9\"cellular",
    iPhone6          = "iphone6",
    iPhone6plus      = "iphone6plus",
    iPhone6S         = "iphone6s",
    iPhone6Splus     = "iphone6splus",
    iPhoneSE         = "iphonese",
    iPhone7          = "iphone7",
    iPhone7plus      = "iphone7plus",
    iPhone8          = "iphone8",
    iPhone8plus      = "iphone8plus",
    iPhoneX          = "iphoneX",
    iPhoneXs         = "iphoneXs",
    iPhoneXsMax      = "iPhoneXsMax",
    iPhoneXr         = "iphoneXr",
    unrecognized     = "?unrecognized?"
}

extension UIDevice {
    
    enum DeviceType {
        
        case iPhone35 // iPhone 4, 4S - NOTE: When our app is run on the iPad we get UIDevice.current.userInterfaceIdiom = .phone with UIScreen.main.bounds.size width 320.0 height 480.0 so this case is used
        case iPhone40 // iPhone 5,SE
        case iPhone47 // iPhone 6/7/8
        case iPhone55 // iPhone 6/7/8 Plus
        case iPhone58 // iPhone X or Xs
        case iPhone61or65 // iPhone Xr or Xs Max ... Max is larger (6.5") with lower resolution so same UIKit Point height (@2x device)
        case iPad
        
        var isIphone: Bool {
            return [.iPhone40, .iPhone47, .iPhone55, .iPhone58, .iPhone61or65].contains(self)
        }
        
    }
    
   private var deviceType: DeviceType? {
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            return .iPad
        case .phone:
            let screenSize = UIScreen.main.bounds.size
            let height = max(screenSize.width, screenSize.height)
            
            switch height {
            case 480: return .iPhone35
            case 568: return .iPhone40
            case 667: return .iPhone47
            case 736: return .iPhone55
            case 812: return .iPhone58
            case 896: return .iPhone61or65
            default: return nil
            }
        default:
            return nil
        }
    }
    
    static var type: DeviceType {
        guard let deviceType = UIDevice.current.deviceType else { fatalError() }
        return deviceType
    }
    
    public var deviceModel: DeviceModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) { ptr in String.init(validatingUTF8: ptr) }
        }
        var modelMap: [ String : DeviceModel ] = [
            "i386": .simulator,
            "x86_64": .simulator,
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad2,5": .iPadMini1,
            "iPad2,6": .iPadMini1,
            "iPad2,7": .iPadMini1,
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPad4,2": .iPadAir1,
            "iPad5,4": .iPadAir2,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad6,3": .iPadPro97,
            "iPad6,4": .iPadPro97cell,
            "iPad6,12": .iPad5,
            "iPad6,7": .iPadPro129,
            "iPad6,8": .iPadPro129cell,
            "iPad7,1": .iPadPro2129,
            "iPad7,2": .iPadPro2129cell,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,2": .iPhone7plus,
            "iPhone9,3": .iPhone7,
            "iPhone9,4": .iPhone7plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,2": .iPhone8plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,4": .iPhone8,
            "iPhone10,5": .iPhone8plus,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXs,
            "iPhone11,4": .iPhoneXsMax,
            "iPhone11,8": .iPhoneXr
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            return model
        }
        return DeviceModel.unrecognized
    }
    
    static func supportsTouchID() -> Bool {
        let context: LAContext = LAContext()
        return context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
    }

}
