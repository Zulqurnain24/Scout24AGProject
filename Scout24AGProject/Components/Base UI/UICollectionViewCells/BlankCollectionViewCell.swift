//
//  BlankCollectionViewCell.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class BlankCollectionViewCell: BaseCollectionViewCell {
    
    static let cellID = "BlankCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = Palette.gray1.color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
