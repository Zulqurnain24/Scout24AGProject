//
//  PropertyListPresenter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PropertyListPresenter: NSObject {
    
    private weak var view: PropertyListViewType?
    private var interactor: PropertyListInteractorType?
    private var router: PropertyListRouterType?
    
    private var datasource = [PropertyListRecord]()

    private var selectedCategory: Int = 0
    private var selectedCategoryId: Int = 0
    private let adIndex = 3
    required init(view: PropertyListViewType, interactor: PropertyListInteractorType, router: PropertyListRouterType) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension PropertyListPresenter: PropertyListPresenterType {
    func setDataSource(datasource: [PropertyListRecord]) {
        self.datasource = datasource
    }

    func fetchPropertyListInfo() {
        interactor?.fetchPropertyListInfo(completion: { (result: ServiceResult<PropertyListInfo>) in
            switch result {
            case .success(let propertyListInfo):
                print(propertyListInfo)
                self.datasource = propertyListInfo.propertyRecordsArray
                self.markFavouriteItems()
                self.insertAds()
                self.view?.reloadData()
            case .failure: break
            }
        })
    }
    
    func insertAds() {
        for i in 0...datasource.count {
            if i % adIndex == 0, i > 0 {
                datasource.insert(PropertyListRecord(), at: i)
            }
        }
    }
    
    func markFavouriteItems() {
        guard let favouriteArray = PersistenceStoreManager.shared.getArray(name: "favouriteArray") as [Int]? else { return }
        favouriteArray.forEach({ index in
            guard index < datasource.count else { return }
            datasource[index].isFavourite = true
        })
    }
    
    // MARK: - Life Cycle
    
    func viewDidLoad() {

    }
    
    func viewDidAppear() {
        fetchPropertyListInfo()
    }
    
    func didSelectItem(at indexPath: IndexPath, in collectionView: UICollectionView) {
        guard view != nil else { return }
        router?.presentPropertyDetailViewController(sender: view as! UIViewController, propertyListRecord: datasource[indexPath.row], index: indexPath.row)
    }
    
    func sizeForItem(collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0.5 * (collectionView.frame.width), height: (250 / 667) * UIScreen.main.bounds.height)
    }
    
    func minimumLineSpacingForSection(section: Int) -> CGFloat {
        return 25
    }
    
    func minimumInteritemSpacingForSection(section: Int) -> CGFloat {
        return 0
    }
    
    func heightForHeader(collectionView: UICollectionView, for section: Int) -> CGSize {
        return CGSize(width: (0.75) * collectionView.frame.size.width, height: (0.065) * collectionView.frame.size.height)
    }
    
    func heightForFooter(collectionView view: UICollectionView, for section: Int) -> CGSize {
        return UIDevice.type == .iPhone58 || UIDevice.type == .iPhone61or65 ? CGSize(width: view.frame.width, height: 100) : CGSize(width: view.frame.width, height: 64) //Footer sized to allow for Show On Me Button appearance
    }
    
    func insetsForSection(section: Int) -> UIEdgeInsets {
        return .zero
    }
    // MARK: - Load Data
    
    func loadData() {
        //view?.reloadData()
    }
    
    func didSelectItem(at: NSIndexPath, in: UICollectionView) {
        guard view != nil else { return }
        guard datasource[at.row].title == "", datasource[at.row].id == -1 else {
            router?.presentPropertyDetailViewController(sender: view as! UIViewController, propertyListRecord: self.datasource[at.row], index: at.row)
            return
        }
        router?.presentAdScreenViewController(sender: view as! UIViewController, imageName: self.datasource[at.row].title)
    }
    
}

// MARK: - UISearchBarDelegate

extension PropertyListPresenter: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
}

// MARK: - UICollectionViewDatasource
extension PropertyListPresenter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    // Section Header View
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleButtonSectionHeader.sectionHeaderID, for: indexPath) as? TitleButtonSectionHeader else {
                return UICollectionReusableView()
            }
            view.frame = CGRect(origin: view.frame.origin, size: CGSize(width: view.frame.size.width, height: 45))
            view.titlePosition = TitleAlignment.center
            view.titleColor = Palette.gray3.color
            view.title = "\(datasource.filter({$0.id != -1 && $0.title != ""}).count) \(PropertyList.propertyTitle.localized)"

            view.updateConstraints()
            view.shouldHideButton = true
            return view
        case UICollectionView.elementKindSectionFooter:
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BlankCollectionReusableView.reusableViewID, for: indexPath) as? BlankCollectionReusableView else {
                return UICollectionReusableView()
            }
            return view
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard datasource[indexPath.row].title == "", datasource[indexPath.row].id == -1 else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailItemCell.cellID, for: indexPath) as? DetailItemCell, let productInfo = datasource[indexPath.item] as PropertyListRecord? else {
                return UICollectionViewCell()
            }
            cell.accessibilityIdentifier = DetailItemCell.cellID
            return configureDetailItemCell(cell: cell, with: productInfo)
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdItemCell.cellID, for: indexPath) as? AdItemCell else {
            return UICollectionViewCell()
        }
        cell.accessibilityIdentifier = AdItemCell.cellID
        return cell
    }
    
    private func configureDetailItemCell(cell: DetailItemCell, with propertyListRecord: PropertyListRecord) -> DetailItemCell {
        cell.setNewsRecord(propertyListRecord: propertyListRecord)
        return cell
    }
    
}
