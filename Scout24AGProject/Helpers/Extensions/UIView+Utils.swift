//
//  UIView+Utils.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

extension UIView {
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var navigationController: UINavigationController? {
        return self.parentViewController?.navigationController
    }
    
}

// MARK: Rounding Corners 

extension UIView {
    
    func round(by amount: CGFloat) {
        guard amount > 0 else { return }
        
        self.layer.cornerRadius = amount
        self.clipsToBounds = true
    }
    
}
