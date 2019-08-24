//
//  PropertyListContract.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol PropertyListViewType: class {
    
    var presenter: PropertyListPresenterType? { get set }
    func animateWithCompletionHandler(completionhandler: @escaping () -> Void )
    func reloadData()
}

protocol PropertyListInteractorType: class {
    
    func fetchPropertyListInfo(completion: @escaping (ServiceResult<(PropertyListInfo)>) -> Void)
    
}

protocol PropertyListRouterType: class {

    func presentPropertyListViewController(sender: UIViewController)
    func presentPropertyDetailViewController(sender: UIViewController, propertyListRecord: PropertyListRecord?, index: Int)
    func presentAdScreenViewController(sender: UIViewController, imageName: String)
}

protocol PropertyListPresenterType: class {
    
    init(view:PropertyListViewType, interactor: PropertyListInteractorType, router: PropertyListRouterType)
    func viewDidLoad()
    func viewDidAppear()
    func loadData()
    func sizeForItem(collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize
    func heightForHeader(collectionView: UICollectionView, for section: Int) -> CGSize
    func heightForFooter(collectionView: UICollectionView, for section: Int) -> CGSize
    func insetsForSection(section: Int) -> UIEdgeInsets
    func minimumLineSpacingForSection(section: Int) -> CGFloat
    func minimumInteritemSpacingForSection(section: Int) -> CGFloat
    func didSelectItem(at: NSIndexPath, in: UICollectionView)
    func setDataSource(datasource: [PropertyListRecord])
    func fetchPropertyListInfo()
    
}

protocol PropertyListRemoteDataManagerType: class, NetworkResponseHandler {
    
    func fetchPropertyListInfo(completion: @escaping (ServiceResult<(PropertyListInfo)>) -> Void)
    
}
