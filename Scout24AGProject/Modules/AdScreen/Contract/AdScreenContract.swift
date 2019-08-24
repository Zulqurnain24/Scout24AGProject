//
//  AdScreenContract.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol AdScreenViewType: class {
    
    var presenter: AdScreenPresenterType? { get set }

}

protocol AdScreenRouterType: class {
    
    func presentAdScreenViewController(sender: UIViewController)
    
}

protocol AdScreenPresenterType: class {
    
    init(view: AdScreenViewType, router: AdScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()

}

