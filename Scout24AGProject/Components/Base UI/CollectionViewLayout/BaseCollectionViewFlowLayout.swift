//
//  BaseCollectionViewFlowLayout.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class BaseCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var animationDirection: UITableView.RowAnimation?
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override init() {
        super.init()
        
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        scrollDirection = .vertical
    }
    
    open func layoutSubViews() {
        
    }
    
    // MARK: - Table view like Left and Right animations on reload
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let direction = animationDirection, let attr = layoutAttributesForItem(at: itemIndexPath) else {
            return super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        }
        
        if direction == .right {
            attr.center = CGPoint(x: UIScreen.main.bounds.width, y: attr.center.y)
        } else if direction == .left {
            attr.center = CGPoint(x: -UIScreen.main.bounds.width, y: attr.center.y)
        }
        attr.alpha = 1
        return attr
    }
    
    override func initialLayoutAttributesForAppearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let direction = animationDirection, let attr = layoutAttributesForSupplementaryView(ofKind: elementKind, at: elementIndexPath) else {
            return super.initialLayoutAttributesForAppearingSupplementaryElement(ofKind: elementKind, at: elementIndexPath)
        }
        
        if direction == .right {
            attr.center = CGPoint(x: UIScreen.main.bounds.width, y: attr.center.y)
        } else if direction == .left {
            attr.center = CGPoint(x: -UIScreen.main.bounds.width, y: attr.center.y)
        }
        attr.alpha = 1
        return attr
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let direction = animationDirection, let attr = layoutAttributesForItem(at: itemIndexPath) else {
            return super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        }
        
        if direction == .right {
            attr.center = CGPoint(x: -UIScreen.main.bounds.width, y: attr.center.y)
        } else if direction == .left {
            attr.center = CGPoint(x: UIScreen.main.bounds.width, y: attr.center.y)
        }
        attr.alpha = 0
        return attr
    }

    override func finalLayoutAttributesForDisappearingSupplementaryElement(ofKind elementKind: String, at elementIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let direction = animationDirection, let attr = layoutAttributesForSupplementaryView(ofKind: elementKind, at: elementIndexPath) else {
            return super.finalLayoutAttributesForDisappearingSupplementaryElement(ofKind: elementKind, at: elementIndexPath)
        }
        
        if direction == .right {
            attr.center = CGPoint(x: -UIScreen.main.bounds.width, y: attr.center.y)
        } else if direction == .left {
            attr.center = CGPoint(x: UIScreen.main.bounds.width, y: attr.center.y)
        }
        attr.alpha = 0
        return attr
    }
    
}
