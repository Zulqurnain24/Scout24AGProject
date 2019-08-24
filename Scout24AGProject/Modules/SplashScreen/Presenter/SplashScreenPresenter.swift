//
//  SplashScreenPresenter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class SplashScreenPresenter: NSObject {
    
    private weak var view: SplashScreenViewType?
    private var router: SplashScreenRouterType?

    required init(view: SplashScreenViewType, router: SplashScreenRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - NewsDetailPresenterType

extension SplashScreenPresenter: SplashScreenPresenterType {
    func viewDidLoad() {

        view?.animateWithCompletionHandler(completionhandler: {
            self.router?.presentOptionScreenViewController(sender: self.view as! UIViewController)
        })
        
    }
    
    func viewDidAppear() {
        
    }
}
