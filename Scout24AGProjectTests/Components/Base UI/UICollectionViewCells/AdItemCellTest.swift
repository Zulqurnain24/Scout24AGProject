//
//  AdItemCellTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import CoreLocation
import XCTest
@testable import Scout24AGProject

class AdItemCellTest: XCTestCase {
    
    func testAdItemCell() {
        let adItemCell = AdItemCell()
        adItemCell.setNeedsDisplay()
        cellTest(adItemCell)
    }
    
    // MARK: - private tests
    
    private func cellTest(_ cell: AdItemCell) {
        XCTAssertNotNil(cell)
    }
    
}
