//
//  CustomSpinnerUIImageviewTest.swift
//  Scout24AGProject
//
//  Created by Zulqurnain on 5/21/19.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class CustomSpinnerUIImageviewTest: XCTestCase {
    
    func testCustomSpinnerUIImageviewTest() {
        let customSpinnerUIImageview = CustomSpinnerUIImageview(image: UIImage(named: "SplashScreenLoader.png"), animationImagesNames: ["SplashScreenLoader1.png", "SplashScreenLoader2.png", "SplashScreenLoader3.png", "SplashScreenLoader4.png"], animateDuration: Float(2.5))
        spinTest(customSpinnerUIImageview)
        stopTest(customSpinnerUIImageview)
    }
    
    // MARK: - private tests

    private func spinTest(_ customSpinnerUIImageview: CustomSpinnerUIImageview) {
        customSpinnerUIImageview.spin()
        XCTAssertNotNil(customSpinnerUIImageview)
    }
    
    private func stopTest(_ customSpinnerUIImageview: CustomSpinnerUIImageview) {
        customSpinnerUIImageview.stop()
        XCTAssertNotNil(customSpinnerUIImageview)
    }

}
