//
//  UIImageView+Utils.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImageView {
    
    func setRectFor(image: UIImage) {
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: self.bounds)
        self.frame = rect
    }
    
}
