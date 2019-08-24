//
//  PropertyDetailViewcontroller.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class PropertyDetailViewController: BaseViewController {
    
    var presenter: PropertyDetailPresenterType?

    var imageURLArray = [String]()
    
    var imageArray = [UIImage]()

    var isFavourite = false
    
    var index: Int? = nil
    
    private lazy var pageScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = Palette.white.color
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.accessibilityIdentifier = "pageScrollView"
        scrollView.tag = Tag.pageScrollView.rawValue
        return scrollView
    }()
    
    private lazy var imageScrollPageView: ImageScrollPageView = {
        let imageScrollPageView = ImageScrollPageView(frame: .zero)
        imageScrollPageView.isUserInteractionEnabled = true
        imageScrollPageView.round(by: 6)
        imageScrollPageView.layer.borderWidth = 2
        imageScrollPageView.backgroundColor = Palette.white.color
        imageScrollPageView.tag = Tag.pageScrollView.rawValue
        return imageScrollPageView
    }()
    
    private let propertyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = PropertyDetail.titleLabel.localized
        label.font = Typography.headlineXL.font
        label.accessibilityIdentifier = "propertyTitleLabel"
        label.backgroundColor = Palette.white.color
        label.numberOfLines = 0
        label.tag = Tag.newsDetailPrimaryLabel.rawValue
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = PropertyDetail.priceLabel.localized
        label.font = Typography.body.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = "priceLabel"
        label.backgroundColor = Palette.white.color
        label.numberOfLines = 0
        label.tag = Tag.newsDetailSecondaryLabel.rawValue
        return label
    }()

    private var favouriteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(toggleFavouriteState), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        button.accessibilityIdentifier = "favouriteButton"
        button.titleLabel?.text = "favouriteButton"
        button.tag = Tag.favouriteButton.rawValue
        return button
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        indicator.color = Palette.gray1.color
        indicator.hidesWhenStopped = true
        indicator.tag = Tag.activityIndicator.rawValue
        return indicator
    }()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.mapType = .standard
        mapView.accessibilityIdentifier = "mapView"
        return mapView
    }()

    private var shouldHideStatusBar: Bool = false

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(PropertyDetail.propertyDetailViewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
        updateFavouriteButtonState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.tabBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Device Model: \(UIDevice.current.deviceModel) is61or65: \(UIDevice.type == .iPhone61or65) is58: \(UIDevice.type == .iPhone58)")
        if UIDevice.type == .iPhone35 {
            pageScrollView.flashScrollIndicators()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        shouldHideStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func setImagesInImageScrollPageView(imageArray: [UIImage]) {
        imageScrollPageView.setImages(imagesArray: imageArray)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    
    // MARK: - Private Methods
    
    @objc private func handleBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    func putLocationOnMap(title: String, location: Location) {
        let annotation = MKPointAnnotation()
        guard let latitude = location.cordinates?.coordinate.latitude as CLLocationDegrees?, let longitude = location.cordinates?.coordinate.longitude as CLLocationDegrees? else { return }
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: centerCoordinate, span: span)
        mapView.region = region
        mapView.setNeedsDisplay()
    }
    
    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()

        view.addSubview(pageScrollView)
        pageScrollView.addSubview(propertyTitleLabel)
        pageScrollView.addSubview(priceLabel)
        pageScrollView.addSubview(imageScrollPageView)
        pageScrollView.addSubview(activityIndicator)
        pageScrollView.addSubview(mapView)
        pageScrollView.addSubview(favouriteButton)
        pageScrollView.bringSubviewToFront(activityIndicator)
    }
    
    func updateFavouriteButtonState() {
        isFavourite ?
            favouriteButton.setImage(#imageLiteral(resourceName: "heart-filled-big"), for: .normal)
            :
            favouriteButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        favouriteButton.setNeedsDisplay()
    }
    
    @objc func toggleFavouriteState() {
        isFavourite = !isFavourite
        updateFavouriteButtonState()
        guard isFavourite == true else { return }
        guard let index = self.index as Int?, let favouriteArray = PersistenceStoreManager.shared.getArray(name: "favouriteArray") as [Int]? else {
            var newArray = [Int]()
            guard let i = self.index else { return }
            newArray.append(i)
            PersistenceStoreManager.shared.setArray(key: "favouriteArray", value: newArray)
            return
        }
        var array = Array(Set(favouriteArray)) as [Int]?
        array?.append(index)
        guard array != nil else { return }
        PersistenceStoreManager.shared.setArray(key: "favouriteArray", value: array!)
    }
    
    private func setupRegularConstraints() {

        pageScrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageScrollPageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(600 / 667 * UIScreen.main.bounds.width)
            make.height.equalTo(250 / 667 * UIScreen.main.bounds.height)
        }
        
        favouriteButton.snp.makeConstraints { (make) in
            make.top.equalTo(imageScrollPageView.snp.bottom)
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(50 / 667 * UIScreen.main.bounds.width)
            make.height.equalTo(50 / 667 * UIScreen.main.bounds.height)
        }
        
        propertyTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(favouriteButton.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(600 / 667 * UIScreen.main.bounds.width)
            make.height.equalTo(60 / 667 * UIScreen.main.bounds.height)
        }

        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(propertyTitleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(600 / 667 * UIScreen.main.bounds.width)
            make.height.equalTo(50 / 667 * UIScreen.main.bounds.height)
        }
        
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(priceLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(600 / 667 * UIScreen.main.bounds.width)
            make.height.equalTo(250 / 667 * UIScreen.main.bounds.height)
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(pageScrollView.snp.center)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }

    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

// MARK: - MKMapView Delegate

extension PropertyDetailViewController: MKMapViewDelegate {
    
}

// MARK: - PropertyDetailViewType

extension PropertyDetailViewController:  PropertyDetailViewType {
    func setPropertyDetail(propertyListRecord: PropertyListRecord?, index: Int) {
        activityIndicator.startAnimating()
        guard let propertyListRecord = propertyListRecord as PropertyListRecord?,
            let title = propertyListRecord.title as String?,
            let location = propertyListRecord.location as Location?,
            let index = index as Int?,
            let isFavourite = propertyListRecord.isFavourite as Bool?,
            let price = propertyListRecord.price as Double? else { return }
        self.index = index
        self.isFavourite = isFavourite
        putLocationOnMap(title: title, location: location)
        propertyTitleLabel.text = "\(PropertyDetail.titleLabel.localized) \(title)"
        priceLabel.text = "\(PropertyDetail.priceLabel.localized) \(price)/-"
        imageURLArray.forEach({ urlString in
            ImageUtility.shared.downloadImage(imageUrl: urlString) { (image) in
                guard let image = image as UIImage? else {
                  return
                }
                self.imageArray.append(image)
            }

        })
        DispatchQueue.main.async {
            self.imageScrollPageView.setImages(imagesArray: self.imageArray)
            self.imageScrollPageView.setNeedsDisplay()
        }
        self.activityIndicator.stopAnimating()
    }
    
}


// MARK: - Tags

private extension PropertyDetailViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case navigationBar = 1
        case newsDetailImageView = 2
        case newsDetailPrimaryLabel = 3
        case newsImageView = 4
        case newsDetailSecondaryLabel = 5
        case backgroundImageView = 6
        case navigationView = 7
        case backButton = 10
        case pageScrollView = 11
        case activityIndicator
        case favouriteButton
    }
    
}

