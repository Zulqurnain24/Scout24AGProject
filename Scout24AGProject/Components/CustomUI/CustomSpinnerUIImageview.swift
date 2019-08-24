//
//  CustomSpinnerUIImageview.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/05/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class CustomSpinnerUIImageview: UIImageView {

    init(image: UIImage?, animationImagesNames: [String], animateDuration: Float) {
        super.init(image: image)
        var images: [AnyHashable] = []
        for i in 0..<animationImagesNames.count {
            if let image = UIImage(named: animationImagesNames[i]) {
                images.append(image)
            }
        }
        self.animationImages = images as? [UIImage]
        self.animationDuration = TimeInterval(animateDuration)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func spin() {
        self.startAnimating()
    }
    
    func stop() {
       self.stopAnimating()
    }
}
