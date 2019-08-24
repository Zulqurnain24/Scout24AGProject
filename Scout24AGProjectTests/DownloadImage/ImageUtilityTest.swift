//
//  ImageUtilityTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 03/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class ImageUtilityTest: XCTestCase {
    
    func testImageUtility() {
        ImageUtility.shared.downloadImage(imageUrl: "https://cidco-smartcity.niua.org/wp-content/uploads/2017/08/navimumbai1.jpg", completion: { image in
            self.downloadImageTest(image: image!)
        })
    }
    
    // MARK: - private tests
    
    private func downloadImageTest(image: UIImage) {
        XCTAssertEqual(image, UIImage(named: "navimumbai1.jpg"))
    }
    
}
