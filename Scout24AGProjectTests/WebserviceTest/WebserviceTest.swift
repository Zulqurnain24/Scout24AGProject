//
//  WebserviceTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 03/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

import XCTest
@testable import Scout24AGProject

class WebserviceTest: XCTestCase {
    
    func testDownloadJSON() {
        let endpoint = PropertyListEndpoint.propertyList
        Alamofire.request(endpoint).scout24AGProjectResponseJSON { (response) in
            switch response.result {
            case .success(let json):
               self.downloadJsonTest(downloadedJSON: json, jsonString: JSON("realEstates.json"))
            case .failure:
                print("Failed")
            }
        }
    }
    
    // MARK: - private tests
    
    private func downloadJsonTest(downloadedJSON: JSON, jsonString : JSON) {
        XCTAssertEqual(downloadedJSON, jsonString)
    }
    
}
