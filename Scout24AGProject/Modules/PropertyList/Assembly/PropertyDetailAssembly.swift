//
//  NewsDetailAssembly.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class PropertyDetailAssembly: Assembly {

    func assemble(container: Container) {
        container.register(PropertyDetailRouterType.self) { (resolver) in
            return PropertyDetailRouter(container: container)
        }
        
        container.register(PropertyDetailViewType.self) { (_) in
            PropertyDetailViewController()
            }.initCompleted { (resolver, propertyDetailView) in
                propertyDetailView.presenter = resolver.resolve(PropertyDetailPresenterType.self)!
        }

        container.register(PropertyDetailPresenterType.self) { (resolver) in
            let view = resolver.resolve(PropertyDetailViewType.self)!
            let router = resolver.resolve(PropertyDetailRouterType.self)!
            return PropertyDetailPresenter(view: view, router: router ) as PropertyDetailPresenterType
        }

    }
    
}

