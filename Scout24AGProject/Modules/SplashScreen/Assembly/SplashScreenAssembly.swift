//
//  SplashScreenAssembly.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Swinject

class SplashScreenAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SplashScreenRouterType.self) { (resolver) in

            return SplashScreenRouter(container: container)
        }
        
        container.register(SplashScreenViewType.self) { (_) in
            SplashScreenViewController()
            }.initCompleted { (resolver, splashView) in
                splashView.presenter = resolver.resolve(SplashScreenPresenterType.self)!
        }
        
        container.register(SplashScreenPresenterType.self) { (resolver) in
            let view = resolver.resolve(SplashScreenViewType.self)!
            let router = resolver.resolve(SplashScreenRouterType.self)!
            return SplashScreenPresenter(view: view , router: router) as SplashScreenPresenterType
        }

    }
    
}

