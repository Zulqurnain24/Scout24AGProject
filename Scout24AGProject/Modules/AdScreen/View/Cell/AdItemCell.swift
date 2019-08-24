//
//  AdItemCell.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//
import UIKit

class AdItemCell: BaseCollectionViewCell {
    
    static let cellID = "AdItemCell"

    private let detailCellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.white.color
        view.tag = DetailItemCellTag.detailCellContainer.rawValue
        return view
    }()
    
    private var adImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Palette.gray2.color
        imageView.isUserInteractionEnabled = true
        imageView.round(by: 6)
        imageView.layer.borderWidth = 2
        imageView.image = UIImage(named:"adImage.png" )
        imageView.layer.borderColor = Palette.clear.color.cgColor
        imageView.tag = DetailItemCellTag.adImageView.rawValue
        return imageView
    }()

    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()
        detailCellContainer.addSubview(adImageView)
        addSubview(detailCellContainer)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupRegularConstraints() {
        detailCellContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        adImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    private enum DetailItemCellTag: Int {
        
        case detailCellContainer = 1
        case adImageView
    }
    
}
