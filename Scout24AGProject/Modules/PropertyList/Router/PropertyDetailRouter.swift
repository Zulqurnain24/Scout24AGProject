//
//  NewsDetailRouter.swift
//  ElementsInteractiveAssignment
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class PropertyDetailRouter {

    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    
}

// MARK: - FittingRoomRouterType

extension PropertyDetailRouter: PropertyDetailRouterType {
    func presentPropertyDetailViewController(sender: UIViewController, propertyListRecord: PropertyListRecord?, index: Int) {
        
        guard let controller = container.resolve(PropertyDetailViewType.self) as? PropertyDetailViewController, let visibleViewController = sender.navigationController?.visibleViewController else { return }
        guard visibleViewController is PropertyDetailViewController == false else { return } // guard against re-presenting if already visible
        sender.navigationController?.isNavigationBarHidden = false
        sender.navigationController?.navigationItem.hidesBackButton = false
        controller.setPropertyDetail(propertyListRecord: propertyListRecord, index: index)
        sender.navigationController?.pushViewController(controller, animated: true)
    }

}

