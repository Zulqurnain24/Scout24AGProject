//
//  SplashContract.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol SplashScreenViewType: class {
    
    var presenter: SplashScreenPresenterType? { get set }
    func animateWithCompletionHandler(completionhandler: @escaping () -> Void )
}

protocol SplashScreenRouterType: class {
    
    func presentSplashScreenViewController(in window: UIWindow)
    func presentOptionScreenViewController(sender: UIViewController)
}

protocol SplashScreenPresenterType: class {
    
    init(view: SplashScreenViewType,router: SplashScreenRouterType)
    
    func viewDidLoad()
    
    func viewDidAppear()
}
