//
//  PropertyListFlowLayout.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PropertyListFlowLayout: BaseCollectionViewFlowLayout {
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        scrollDirection = .vertical
    }
    
    override func layoutSubViews() {
        setupRegularLayout()
    }
    
    private func setupRegularLayout() {
        minimumLineSpacing = 30
        minimumInteritemSpacing = 30
        sectionInset = UIEdgeInsets.init(top: 60, left: 0, bottom: 30, right: 0)
    }
}

