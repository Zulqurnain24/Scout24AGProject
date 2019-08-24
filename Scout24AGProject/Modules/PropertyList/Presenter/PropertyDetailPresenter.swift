//
//  NewsDetailPresenter.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class PropertyDetailPresenter: NSObject {
    
    private weak var view: PropertyDetailViewType?
    private var router: PropertyDetailRouterType?
   
    private var selectedNewsRecord: PropertyListRecord!
    
    required init(view: PropertyDetailViewType, router: PropertyDetailRouterType) {
        self.view = view
        self.router = router
    }
}

// MARK: - PropertyDetailPresenterType

extension PropertyDetailPresenter: PropertyDetailPresenterType {
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func setPropertyDetail(selectedNewsRecord: PropertyListRecord?) {
        
    }
  
}
