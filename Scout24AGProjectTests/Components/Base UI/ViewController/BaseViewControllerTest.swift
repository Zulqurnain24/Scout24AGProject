//
//  BaseViewControllerTest.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class BaseViewControllerTest: XCTestCase {
    
    func testViewControllerInitialization() {
        let viewController = BaseViewController()
        viewController.viewDidLoad()
        
        XCTAssertNil(viewController.navigationItem.rightBarButtonItem)
        XCTAssertNil(viewController.navigationItem.leftBarButtonItem)
    }
    
    func testViewControllerInitializationShowingShoppingBagButton() {
        let viewController = BaseViewController()
        viewController.viewDidLoad()
        
        XCTAssertNil(viewController.navigationItem.rightBarButtonItem)
        XCTAssertNil(viewController.navigationItem.leftBarButtonItem)
    }
    
}
