//
//  BlankCollectionReusableView.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class BlankCollectionReusableView: UICollectionReusableView {
    
    static var reusableViewID = "BlankCollectionReusableView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup the view
    
    private func setupView() {
        backgroundColor = Palette.white.color
    }

}
