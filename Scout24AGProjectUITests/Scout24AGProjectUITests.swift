//
//  Scout24AGProjectUITests.swift
//  Scout24AGProjectUITests
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class Scout24AGProjectUITests: XCTestCase {
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = true
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")

    }

    // MARK: - Tests
    
    //test swipe On propertyOverviewCollectionView
    func testSwipeOnPropertyOverviewCollectionView() {
        //launch app
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)
        
        let collectionview = XCUIApplication().collectionViews["propertyOverviewCollectionView"]
        collectionview.swipeUp()
        collectionview.swipeDown()
        collectionview.swipeLeft()
        collectionview.swipeRight()
        
        app.terminate()
        
    }

    //test Tap On Cell Flow
    func testTapOnCellFlow() {
        //launch app
        app.launch()

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)

        app.collectionViews.cells.element(boundBy: 0).tap()
        
    }
    
    //    //test swipe On Scrollview Flow
    func testSwipeOnScrollviewFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
        //continuing from Tap On Cell Flow
        let map = XCUIApplication().maps["pageScrollView"]
            map.swipeUp()
            map.swipeDown()
            map.swipeLeft()
            map.swipeRight()
        }
        
    }
    
    //test Tap On AdCell Flow
    func testSwipeOnMapFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { // Change `2.0` to the desired number of seconds.
            let map = XCUIApplication().maps["mapView"]
            map.swipeUp()
            map.swipeDown()
            map.swipeLeft()
            map.swipeRight()

            self.app.terminate()
        }
    }
    
    //test swipe On map Flow
    func testTapOnAdCellFlow() {
        //launch app
        app.launch()

        // Make sure we're displaying onboarding
        XCTAssertTrue(app.exists)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { // Change `2.0` to the desired number of seconds.
            self.app.collectionViews.cells.element(boundBy: 3).tap()
            
            self.app.terminate()
        }

    }
}
