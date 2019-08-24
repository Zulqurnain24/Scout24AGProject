//
//  NSAttributedString+Utils.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

extension NSAttributedString {
    
    func modifiedline(height: CGFloat) -> NSAttributedString {
        let attrString = NSMutableAttributedString(attributedString: self)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 0
        style.maximumLineHeight = height
        style.minimumLineHeight = height
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.string.count))
        
        return attrString
    }
    
}
