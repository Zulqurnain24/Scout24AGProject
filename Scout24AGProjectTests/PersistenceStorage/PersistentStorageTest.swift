//
//  PersistentStorageTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 03/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class PersistentStorageTest: XCTestCase {

    func testPersistentStorage() {
        var newArray = [Int]()
        newArray.append(1)
        newArray.append(0)
        newArray.append(9)
        newArray.append(11)
        PersistenceStoreManager.shared.setArray(key: "favouriteArray", value: newArray)
    }
    
    // MARK: - private tests
    
    private func retreivePersistenceStoreValueTest(array: [Int]) {
        XCTAssertEqual(array, PersistenceStoreManager.shared.getArray(name: "favouriteArray"))
    }
    
}
