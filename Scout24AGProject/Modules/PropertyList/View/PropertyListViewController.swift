//
//  PropertyListViewController.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import SnapKit

class PropertyListViewController: BaseViewController {
    
    var presenter: PropertyListPresenterType? {
        didSet {
            propertyOverviewCollectionView.dataSource = presenter as? UICollectionViewDataSource
        }
    }
    
    private let propertyOverviewLayout = PropertyListFlowLayout()
    
    private lazy var propertyOverviewCollectionView: BaseCollectionView = {
        let collectionView: BaseCollectionView = BaseCollectionView(frame: .zero, collectionViewLayout: self.propertyOverviewLayout)
        collectionView.delegate = self
        collectionView.backgroundColor = Palette.white.color
        collectionView.register(AdItemCell.self, forCellWithReuseIdentifier: AdItemCell.cellID)
        collectionView.register(DetailItemCell.self, forCellWithReuseIdentifier: DetailItemCell.cellID)
        collectionView.register(BlankCollectionViewCell.self, forCellWithReuseIdentifier: BlankCollectionViewCell.cellID)
        collectionView.register(TitleButtonSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleButtonSectionHeader.sectionHeaderID)
        collectionView.register(BlankCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: BlankCollectionReusableView.reusableViewID)
        collectionView.accessibilityIdentifier = "propertyOverviewCollectionView"
        collectionView.tag = NewsOverviewTag.newsOverviewCollectionView.rawValue
        return collectionView
    }()
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        extendedLayoutIncludesOpaqueBars = true
        setupViews()
        presenter?.viewDidLoad()
        propertyOverviewCollectionView.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        propertyOverviewCollectionView.collectionViewLayout.invalidateLayout()
        presenter?.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - UI Setup
    
    override func setupViews() {
        super.setupViews()
        
        view.accessibilityIdentifier = "PropertyListViewController"
        view.addSubview(propertyOverviewCollectionView)
        self.title = PropertyList.viewControllerTitle.localized
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        guard traitCollection != previousTraitCollection else { return }
        switch traitCollection.verticalSizeClass {
        case .regular: setupRegularConstraints()
        case .compact, .unspecified: break
        }
    }
    
    private func setupRegularConstraints() {
        
        propertyOverviewCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset((self.view.navigationController?.navigationBar.frame.height)!)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
}

// MARK: - NewsOverviewViewType

extension PropertyListViewController: PropertyListViewType {
    func animateWithCompletionHandler(completionhandler: @escaping () -> Void) {
        completionhandler()
    }
    
    
    func reloadData() {
        propertyOverviewCollectionView.reloadData()
    }
    
    func reloadItems() {
        guard propertyOverviewCollectionView.numberOfSections > 1 else { return }
        propertyOverviewCollectionView.reloadSections([1])
    }
    
    func showErrorAlertWith(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //SPECIAL HANDLING FOR DATA FETCH ERROR.. not provided by BaseViewController.showErrorAlert
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (_: UIAlertAction) -> Void in
            if message.contains(PropertyList.dataFetchError.localized) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private enum NewsOverviewTag: Int {
        
        case newsOverviewCollectionView = 1
        
    }
}

// MARK: - UICollectionViewDelegate

extension PropertyListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath as NSIndexPath, in: collectionView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        //productSearchBar.endEditing(true)
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PropertyListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return presenter!.sizeForItem(collectionView: collectionView, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return presenter!.minimumLineSpacingForSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return presenter!.minimumInteritemSpacingForSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return presenter!.heightForHeader(collectionView: collectionView, for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return presenter!.heightForFooter(collectionView: collectionView, for: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return presenter!.insetsForSection(section: section)
    }
    
}

