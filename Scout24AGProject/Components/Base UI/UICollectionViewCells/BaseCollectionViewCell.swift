//
//  BaseCollectionViewCell.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

open class BaseCollectionViewCell: UICollectionViewCell {
    
    private let separatorView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = Palette.gray1.color
        lineView.tag = 0
        return lineView
    }()
    
    var shouldHideSeparatorLineView: Bool = false {
        didSet {
            separatorView.isHidden = shouldHideSeparatorLineView
        }
    }
    
    // MARK: - Initializers
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    open func setupViews() {
        self.isUserInteractionEnabled = true
        clipsToBounds = true
        setupSeparatorLine()
    }
    
    // MARK: - Private Methods
    
    private func setupRegularConstraints() {
        separatorView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    
    private func setupSeparatorLine() {
        backgroundColor = Palette.white.color
        clipsToBounds = true
        addSubview(separatorView)
    }
    
}
