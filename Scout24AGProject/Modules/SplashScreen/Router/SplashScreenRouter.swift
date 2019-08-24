//
//  SplashScreenRouter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class SplashScreenRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    
}

// MARK: - FittingRoomRouterType

extension SplashScreenRouter: SplashScreenRouterType {
    func presentOptionScreenViewController(sender: UIViewController) {
         guard let router = container.resolve(PropertyListRouterType.self) as? PropertyListRouter else { return }
        router.presentPropertyListViewController(sender: sender)
    }
    
    func presentSplashScreenViewController(in window: UIWindow) {
        guard let controller = container.resolve(SplashScreenViewType.self) as? SplashScreenViewController else { return }
        let rootViewController = UINavigationController(rootViewController: controller)
        rootViewController.isNavigationBarHidden = true
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

}

