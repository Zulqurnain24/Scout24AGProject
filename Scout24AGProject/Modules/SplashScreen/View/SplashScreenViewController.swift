//
//  SplashScreenViewController.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class SplashScreenViewController: BaseViewController {
    
    var presenter: SplashScreenPresenterType?

    private let titlelabel: UILabel = {
        let label = UILabel()
        label.text = SplashScreen.viewControllerTitle.localized
        label.font = Typography.headlineXXXL.font
        label.textColor = Palette.blue.color
        label.accessibilityIdentifier = "titlelabelIdentifier"
        label.backgroundColor = Palette.white.color
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 0
        label.tag = Tag.titlelabel.rawValue
        return label
    }()
    
    private var customSpinnerUIImageview: CustomSpinnerUIImageview = {
        let customSpinnerUIImageview = CustomSpinnerUIImageview(image: UIImage(named: "SplashScreenLoader.png"), animationImagesNames: ["SplashScreenLoader1.png", "SplashScreenLoader2.png", "SplashScreenLoader3.png", "SplashScreenLoader4.png"], animateDuration: 2.0)
        customSpinnerUIImageview.contentMode = .scaleAspectFit
        customSpinnerUIImageview.isUserInteractionEnabled = true
        customSpinnerUIImageview.round(by: 6)
        customSpinnerUIImageview.layer.borderWidth = 0
        customSpinnerUIImageview.backgroundColor = Palette.clear.color
        customSpinnerUIImageview.tag = Tag.customSpinnerUIImageview.rawValue
        return customSpinnerUIImageview
    }()

    private var shouldHideStatusBar: Bool = false
    
    private var selectedOutfitIndexPath: IndexPath?

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(SplashScreen.viewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
    }

    func animateWithCompletionHandler(completionhandler: @escaping () -> Void ) {
        customSpinnerUIImageview.spin()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.customSpinnerUIImageview.stop()
            completionhandler()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.tabBar.isHidden = true
        setNeedsStatusBarAppearanceUpdate()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        shouldHideStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
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

        view.addSubview(titlelabel)
        view.addSubview(customSpinnerUIImageview)
    }
    
    private func setupRegularConstraints() {
        
        titlelabel.snp.makeConstraints { (make) in
            make.center.equalTo(customSpinnerUIImageview.snp.center)
            make.height.equalTo(0.5 * UIScreen.main.bounds.height)
            make.width.equalTo(0.25 * UIScreen.main.bounds.width)
        }
        
        customSpinnerUIImageview.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(0.9 * UIScreen.main.bounds.height)
            make.width.equalTo(0.65 * UIScreen.main.bounds.width)
        }

        self.view.bringSubviewToFront(customSpinnerUIImageview)
    }
    
    override var prefersStatusBarHidden: Bool {
        return shouldHideStatusBar
    }
    
}

extension SplashScreenViewController: SplashScreenViewType {
    
}

// MARK: - Tags

private extension SplashScreenViewController {
    
    private enum GestureType: Int {
        
        case torsoSwipe
        case lowerBodySwipe
        case outfitSwipe
        
    }
    
    private enum Tag: Int {
        
        case titlelabel = 0
        case customSpinnerUIImageview
    }
    
}
