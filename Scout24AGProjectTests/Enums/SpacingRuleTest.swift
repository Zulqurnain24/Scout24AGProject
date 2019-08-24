//
//  SpacingRuleTest.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import Scout24AGProject

class SpacingRuleTest: XCTestCase {
    
    func testMargins() {
        XCTAssertEqual(SpacingRule.leftMargin.value, 15)
        XCTAssertEqual(SpacingRule.topMargin.value, 15)
        XCTAssertEqual(SpacingRule.rightMargin.value, -15)
        XCTAssertEqual(SpacingRule.bottomMargin.value, -15)
    }
    
    func testPadding() {
        XCTAssertEqual(SpacingRule.leftPadding.value, 10)
        XCTAssertEqual(SpacingRule.topPadding.value, 10)
        XCTAssertEqual(SpacingRule.rightPadding.value, -10)
        XCTAssertEqual(SpacingRule.bottomPadding.value, -10)
    }
    
}
