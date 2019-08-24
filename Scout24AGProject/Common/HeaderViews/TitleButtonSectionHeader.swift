//
//  TitleButtonSectionHeader.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

enum TitleAlignment: Int {
    typealias RawValue = Int
    
    case justified
    case center
    
    var value: Int {
        switch self {
        case .justified: return 0
        case .center: return 1
        }
    }
}

class TitleButtonSectionHeader: BaseCollectionViewCell {
    
    static let sectionHeaderID = "TitleButtonSectionHeader"
    
    private let titleLabel: UILabel = {
       let label = UILabel()
       label.font = Typography.headlineSmall.font
       label.invalidateIntrinsicContentSize()
       label.tag = 2
       return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font =  Typography.body.font
        label.invalidateIntrinsicContentSize()
        label.tag = 3
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Typography.buttonSmall.font
        button.backgroundColor = Palette.gold.color
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.titleLabel?.invalidateIntrinsicContentSize()
        button.setTitleColor(Palette.black.color, for: .normal)
        button.backgroundColor = Palette.clear.color
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: 10.0, bottom: 0, right: 10.0)
        button.tag = 4
        return button
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var subTitle: String? {
        didSet {
            subTitleLabel.text = subTitle
        }
    }
    
    var buttonTitle: String? {
        didSet {
            button.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var shouldHideButton: Bool = false {
        didSet {
            button.isHidden = shouldHideButton
        }
    }
    
    var titlePosition: TitleAlignment = TitleAlignment.justified {
        didSet {
            guard titlePosition.rawValue == TitleAlignment.center.rawValue else { return }
            self.titleLabel.textAlignment = .center
        }
    }
    
    var titleColor: UIColor = UIColor.black {
        didSet {
            self.titleLabel.textColor = titleColor
        }
    }
    
    // MARK: - UI Setup
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = Palette.white.color
        shouldHideSeparatorLineView = true
        addSubview(button)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }
    
    private func setConstraints() {
        
    }
    
    private func setupRegularConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(titlePosition == TitleAlignment.center ? (5 / 667) * UIScreen.main.bounds.height: (20 / 667) * UIScreen.main.bounds.height)
            make.bottom.equalTo(subTitleLabel.snp.top)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-7)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        
        button.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(28)
            make.bottom.equalTo(subTitleLabel.snp.bottom)
        }
    }
    
    override func updateConstraints() {
        titleLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(titlePosition == TitleAlignment.center ? (10 / 667) * UIScreen.main.bounds.height: (20 / 667) * UIScreen.main.bounds.height)
        }
        
        subTitleLabel.snp.updateConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalToSuperview().offset(-7)
        }
        
        button.snp.updateConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.height.equalTo(28)
            make.bottom.equalTo(subTitleLabel.snp.bottom)
        }
        super.updateConstraints()
    }
    
}
