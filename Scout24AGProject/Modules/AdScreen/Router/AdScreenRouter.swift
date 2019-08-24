//
//  AdScreenRouter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class AdScreenRouter {
    
    private var container: Container
    
    init(container: Container) {
        self.container = container
    }
    
}

extension AdScreenRouter: AdScreenRouterType {
    func presentAdScreenViewController(sender: UIViewController) {
        guard let controller = container.resolve(AdScreenViewType.self) as? AdScreenViewController, let visibleViewController = sender.navigationController?.visibleViewController else { return }
        guard visibleViewController is AdScreenViewController == false else { return } // guard against re-presenting if already visible
        sender.navigationController?.isNavigationBarHidden = false
        sender.navigationController?.navigationItem.hidesBackButton = false
        sender.navigationController?.pushViewController(controller, animated: true)
    }
    
}



