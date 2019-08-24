//
//  PropertyDetailContract.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol PropertyDetailViewType: class {
    
    var presenter: PropertyDetailPresenterType? { get set }

    func setPropertyDetail(propertyListRecord: PropertyListRecord?, index: Int)
    
    func setImagesInImageScrollPageView(imageArray: [UIImage])
}

protocol PropertyDetailRouterType: class {
    
    func presentPropertyDetailViewController(sender: UIViewController, propertyListRecord: PropertyListRecord?, index: Int)
    
}

protocol PropertyDetailPresenterType: class {
    
    init(view: PropertyDetailViewType, router: PropertyDetailRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
    
    func setPropertyDetail(selectedNewsRecord: PropertyListRecord?)
}
