//
//  PropertyListAssembly.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 01/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class PropertyListAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(PropertyListRouterType.self) { (resolver) in
            
            return PropertyListRouter(container: container)
        }
        
        container.register(PropertyListViewType.self) { (_) in
            PropertyListViewController()
            }.initCompleted { (resolver, splashView) in
                splashView.presenter = resolver.resolve(PropertyListPresenterType.self)!
        }
        
        container.register(PropertyListPresenterType.self) { (resolver) in
            let view = resolver.resolve(PropertyListViewType.self)!
            let interactor = resolver.resolve(PropertyListInteractorType.self)!
            let router = resolver.resolve(PropertyListRouterType.self)!
            return PropertyListPresenter(view: view, interactor: interactor, router: router) as PropertyListPresenterType
        }
        
        container.register(PropertyListInteractorType.self) { (resolver) in
            let remoteDataManger = resolver.resolve(PropertyListRemoteDataManagerType.self)!
            return PropertyListInteractor(remoteDataManager: remoteDataManger)
        }

        container.register(PropertyListRemoteDataManagerType.self) { (_) in
            return PropertyListRemoteDataManager(container: container)
        }
        
    }
    
}


