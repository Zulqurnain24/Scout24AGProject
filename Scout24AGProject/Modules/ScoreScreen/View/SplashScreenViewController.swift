//
//  ScoreScreenController.swift
//  RockPaperScissors
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class SplashScreenViewController: ElementsInteractiveAssignmentBaseViewController {
    
    var presenter: NewsDetailPresenterType?

    private var faceboxPointRect  =  CGRect(x: 0, y: 0, width: 0, height: 0)
    
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
    
    private let newsDetailPrimaryLabel: UILabel = {
        let label = UILabel()
        label.text = CSVReader.cSVReaderPasswordPrimaryTitle.localized
        label.font = Typography.headlineXL.font
        label.accessibilityIdentifier = "cSVReaderPrimaryTitle"
        label.backgroundColor = Palette.white.color
        label.tag = Tag.newsDetailPrimaryLabel.rawValue
        return label
    }()
    
    private var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.round(by: 6)
        imageView.layer.borderWidth = 2
        imageView.backgroundColor = Palette.white.color
        imageView.tag = Tag.newsImageView.rawValue
        return imageView
    }()
    
    private let newsDetailSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = CSVReader.cSVReaderPasswordSecondaryTitle.localized
        label.font = Typography.body.font
        label.numberOfLines = 0
        label.accessibilityIdentifier = "cSVReaderSecondaryTitle"
        label.backgroundColor = Palette.white.color
        label.tag = Tag.newsDetailSecondaryLabel.rawValue
        return label
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        indicator.color = Palette.gray1.color
        indicator.hidesWhenStopped = true
        indicator.tag = Tag.activityIndicator.rawValue
        return indicator
    }()
    
    private var onePressGesture: UITapGestureRecognizer?
    private var faceRecognisePressGesture: UITapGestureRecognizer?
    
    private var shouldHideStatusBar: Bool = false
    
    private var selectedOutfitIndexPath: IndexPath?
   
    private var shouldRespondtoTapGestures = true
    
    private let faceDetectQueue: DispatchQueue? = DispatchQueue(label: "FaceDetectQueue", qos: .userInitiated, target: nil)

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(NewsDetail.newsOverviewViewControllerTitle.localized)"
        view.backgroundColor = Palette.white.color
        presenter?.viewDidLoad()
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        pageScrollView.addSubview(newsDetailPrimaryLabel)
        pageScrollView.addSubview(newsDetailSecondaryLabel)
        pageScrollView.addSubview(newsImageView)
        pageScrollView.addSubview(activityIndicator)
        pageScrollView.bringSubviewToFront(activityIndicator)
    }
    
    private func setupRegularConstraints() {

        pageScrollView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        newsImageView.snp.makeConstraints { (make) in
            make.top.equalTo(pageScrollView.snp.top)
            make.left.equalTo(pageScrollView.snp.left)
            make.right.equalTo(pageScrollView.snp.right)
            make.width.equalTo(pageScrollView.snp.width)
            make.height.equalTo(250 / 667 * UIScreen.main.bounds.height)
        }
        
        newsDetailPrimaryLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset( SpacingRule.topPadding.rawValue)
            make.left.equalTo(newsImageView.snp.left).offset(SpacingRule.leftPadding.rawValue)
            make.right.equalTo(newsImageView.snp.right).offset(-1 * SpacingRule.rightPadding.rawValue)
            make.height.equalTo(100 / 667 * UIScreen.main.bounds.height)
            make.bottom.equalTo(newsDetailSecondaryLabel.snp.top).offset(-1 * SpacingRule.bottomPadding.rawValue)
        }

        newsDetailSecondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(newsDetailPrimaryLabel.snp.bottom).offset(1 * SpacingRule.topPadding.rawValue)
            make.left.equalTo(newsImageView.snp.left).offset(SpacingRule.leftPadding.rawValue)
            make.right.equalTo(newsImageView.snp.right).offset(-1 * SpacingRule.rightPadding.rawValue)
            make.height.equalTo(300 / 667 * UIScreen.main.bounds.height)
            make.bottom.equalToSuperview().offset(-1 * SpacingRule.bottomPadding.rawValue)
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

    override func showErrorAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction) -> Void in
            print("OK pressed on error alert")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - NewsDetailViewType

extension NewsDetailViewController: NewsDetailViewType {
    
    func setNewsDetail(selectedNewsRecord: NewsRecord?) {
        activityIndicator.startAnimating()
        guard !(selectedNewsRecord?.title.isEmpty)! else { return }
        newsDetailPrimaryLabel.text = selectedNewsRecord?.title
        guard !(selectedNewsRecord?.description.isEmpty)! else { return }
        newsDetailSecondaryLabel.text = selectedNewsRecord?.description
        guard selectedNewsRecord!.imageURL != nil else { return }
        ImageUtility.shared.downloadImage(imageUrl: (selectedNewsRecord?.imageURL)!) { (image) in
            if image != nil {
                DispatchQueue.main.async {
                    self.newsImageView.image = image
                    self.newsImageView.setNeedsDisplay()
                }
            } else {
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(named: "_No_Image__placeholder.png")
                    self.newsImageView.setNeedsDisplay()
                }
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
}


// MARK: - Tags

private extension NewsDetailViewController {
    
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
        
    }
    
}
