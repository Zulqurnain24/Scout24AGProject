//
//  BaseCollectionView.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView {
    
    // MARK: - Initializers
    
    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
        
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupCollectionView() {
        self.frame = .zero
        self.bounces = true
        self.allowsSelection = true
        self.alwaysBounceVertical = true
        self.backgroundColor = .white
    }
    
}
