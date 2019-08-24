//
//  AdScreenViewController.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class AdScreenViewController: BaseViewController {
    
    var presenter: AdScreenPresenterType?

    private lazy var pageScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = Palette.white.color
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.tag = Tag.pageScrollView.rawValue
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.isUserInteractionEnabled = true
        imageView.round(by: 6)
        imageView.layer.borderWidth = 2
        imageView.backgroundColor = Palette.red.color
        imageView.image = UIImage(named: "adImage")
        imageView.tag = Tag.pageScrollView.rawValue
        return imageView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        indicator.color = Palette.gray1.color
        indicator.hidesWhenStopped = true
        indicator.tag = Tag.activityIndicator.rawValue
        return indicator
    }()

    private var shouldHideStatusBar: Bool = false
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(AdScreen.viewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
        
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
    
    func setImages(imageString: String) {
        imageView.image = UIImage(named: imageString)
        imageView.setNeedsDisplay()
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
    
    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()
        
        view.addSubview(pageScrollView)
        pageScrollView.addSubview(activityIndicator)
        pageScrollView.addSubview(imageView)
        pageScrollView.bringSubviewToFront(activityIndicator)
    }
   
    private func setupRegularConstraints() {
        
        pageScrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(pageScrollView.snp.top)
            make.left.equalTo(pageScrollView.snp.left)
            make.right.equalTo(pageScrollView.snp.right)
            make.bottom.equalTo(pageScrollView.snp.bottom)
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

extension AdScreenViewController: AdScreenViewType {
    
}

// MARK: - Tags

private extension AdScreenViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case navigationBar = 1
        case imageView
        case pageScrollView
        case activityIndicator
    }
    
}

