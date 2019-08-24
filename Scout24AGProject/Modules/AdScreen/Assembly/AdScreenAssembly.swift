//
//  AdScreenAssembly.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class AdScreenAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(AdScreenRouterType.self) { (resolver) in
            return AdScreenRouter(container: container)
        }
        
        container.register(AdScreenViewType.self) { (_) in
            AdScreenViewController()
            }.initCompleted { (resolver, propertyDetailView) in
                propertyDetailView.presenter = resolver.resolve(AdScreenPresenterType.self)!
        }
        
        container.register(AdScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(AdScreenViewType.self)!
            let router = resolver.resolve(AdScreenRouterType.self)!
            return AdScreenPresenter(view: view, router: router ) as AdScreenPresenter
        }
        
    }
    
}
