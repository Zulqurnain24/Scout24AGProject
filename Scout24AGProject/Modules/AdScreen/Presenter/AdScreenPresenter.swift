//
//  AdScreenPresenter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class AdScreenPresenter: NSObject {
    
    private weak var view: AdScreenViewType?
    private var router: AdScreenRouterType?

    required init(view: AdScreenViewType, router: AdScreenRouterType) {
        self.view = view
        self.router = router
    }
    
}

extension AdScreenPresenter: AdScreenPresenterType {
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }

}
