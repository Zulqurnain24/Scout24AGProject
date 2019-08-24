//
//  PropertyListRouter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class PropertyListRouter {
    
    private var container: Container
    
    init(container: Container) {
        self.container = container
    }

}

extension PropertyListRouter: PropertyListRouterType {
    func presentAdScreenViewController(sender: UIViewController, imageName: String) {
        guard let router = container.resolve(AdScreenRouterType.self) as? AdScreenRouter else { return }
        router.presentAdScreenViewController(sender: sender)
    }
    
    func presentPropertyDetailViewController(sender: UIViewController, propertyListRecord: PropertyListRecord?, index: Int) {
        guard let router = container.resolve(PropertyDetailRouterType.self) as? PropertyDetailRouter else { return }
        router.presentPropertyDetailViewController(sender: sender, propertyListRecord: propertyListRecord, index: index)
    }

    func presentPropertyListViewController(sender: UIViewController) {
        guard let controller = container.resolve(PropertyListViewType.self) as? PropertyListViewController, let visibleViewController = sender.navigationController?.visibleViewController else { return }
        guard visibleViewController is PropertyListViewController == false else { return } // guard against re-presenting if already visible
        sender.navigationController?.isNavigationBarHidden = true
        sender.navigationController?.navigationItem.hidesBackButton = true
        guard controller.presenter != nil else { return }
        let rootViewController = UINavigationController(rootViewController: controller)
        rootViewController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = rootViewController
    }
    
}


