//
//  DetailItemCell.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class DetailItemCell: BaseCollectionViewCell {
    
    static let cellID = "DetailItemCellID"

    var isFavourite = false
    
    private let detailCellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Palette.white.color
        view.tag = DetailItemCellTag.detailCellContainer.rawValue
        return view
    }()
    
    private var propertyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = Palette.gray2.color
        imageView.isUserInteractionEnabled = true
        imageView.round(by: 6)
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = Palette.clear.color.cgColor
        imageView.tag = DetailItemCellTag.detailCellContainer.rawValue
        return imageView
    }()
    
    private let propertyNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.black.color
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.minimumScaleFactor = 0.25
        label.numberOfLines = 0
        label.font = UIDevice.type == .iPhone35 || UIDevice.type == .iPhone40 ? Typography.headlineMedium.font : Typography.headline.font
        label.tag = DetailItemCellTag.newsNameLabel.rawValue
        return label
    }()
    
    private let propertyPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Palette.black.color
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.minimumScaleFactor = 0.25
        label.numberOfLines = 0
        label.font = UIDevice.type == .iPhone35 || UIDevice.type == .iPhone40 ? Typography.bodySmall.font : Typography.bodySmall.font
        label.tag = DetailItemCellTag.newsDescriptionLabel.rawValue
        return label
    }()
    
    private var favouriteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(toggleFavouriteState), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.accessibilityIdentifier = "favouriteButton"
        button.titleLabel?.text = "favouriteButton"
        button.tag = DetailItemCellTag.favouriteButton.rawValue
        return button
    }()
    
    func setNewsRecord(propertyListRecord: PropertyListRecord) {
        guard let imageArray = propertyListRecord.imagesArray as [Image]?, let image = imageArray.first as Image?, let url = image.url as String? else { return }
        ImageUtility.shared.downloadImage(imageUrl: url) { (downloadedImage) in
            if let downloadedImage = downloadedImage {
                DispatchQueue.main.async {
                    self.propertyImageView.image = downloadedImage
                    self.propertyImageView.setNeedsDisplay()
                }
            }
        }
        propertyNameLabel.text = propertyListRecord.title
        propertyPriceLabel.text = "€ \(propertyListRecord.price)/-"
        isFavourite = propertyListRecord.isFavourite
        toggleFavouriteState()
    }
   
    @objc func toggleFavouriteState() {
        isFavourite = !isFavourite
        isFavourite ? favouriteButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal) : favouriteButton.setImage(#imageLiteral(resourceName: "heart-filled-big"), for: .normal)
        self.setNeedsDisplay()
    }
    
    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()
        
        toggleFavouriteState()
        self.accessibilityIdentifier = DetailItemCell.cellID
        detailCellContainer.addSubview(propertyImageView)
        detailCellContainer.addSubview(propertyPriceLabel)
        detailCellContainer.addSubview(propertyNameLabel)
        detailCellContainer.addSubview(favouriteButton)
        addSubview(detailCellContainer)
        detailCellContainer.bringSubviewToFront(favouriteButton)
    
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
        
        propertyImageView.image = nil
    }
    
    private func setupRegularConstraints() {
        detailCellContainer.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
       propertyImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(150 / 667 * UIScreen.main.bounds.height)
            make.bottom.equalTo(propertyNameLabel.snp.top)
            if UIDevice.type == .iPhone35 || UIDevice.type == .iPhone40 {
                make.width.equalTo(171 / 375 * UIScreen.main.bounds.width)
            } else {
                make.width.equalTo(173 / 375 * UIScreen.main.bounds.width)
            }
        }

        propertyNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(propertyImageView.snp.bottom)
            make.width.equalTo(30 / 375 * UIScreen.main.bounds.width)
            make.bottom.equalTo(propertyPriceLabel.snp.top)
        }

        propertyPriceLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(propertyImageView.snp.bottom).offset(65)
            make.width.equalTo(300 / 375 * UIScreen.main.bounds.width)
            make.bottom.equalToSuperview()
        }
        
        favouriteButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(propertyImageView.snp.bottom).offset(50)
            make.height.equalTo(25 / 375 * UIScreen.main.bounds.height)
            make.width.equalTo(25 / 375 * UIScreen.main.bounds.width)
        }
    }
   
    private enum DetailItemCellTag: Int {
        
        case detailCellContainer = 1
        case newsImageView
        case newsNameLabel
        case newsDescriptionLabel
        case favouriteButton
    }
    
}
