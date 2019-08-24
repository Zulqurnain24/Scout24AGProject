//
//  DetailItemCellTest.swift
//  Scout24AGProjectTests
//
//  Created by Mohammad Zulqarnain on 02/06/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import CoreLocation
import XCTest
@testable import Scout24AGProject

class DetailItemCellTest: XCTestCase {
    
    func testDetailItemCell() {
        let detailItemCell = DetailItemCell()
        detailItemCell.setNewsRecord(propertyListRecord: PropertyListRecord(id: 1, title: "Schöne Zweiraumwohnung direkt im Grünen", price: 500, isFavourite: false, images: [Image(id: 1, url: "https://pictureis24-a.akamaihd.net/pic/orig01/N/278/959/428/278959428-0.jpg/ORIG/resize/600x400/format/jpg"), Image(id: 2, url: "https://pictureis24-a.akamaihd.net/pic/orig01/N/278/959/436/278959436-0.jpg/ORIG/resize/600x400/format/jpg"), Image(id: 3, url: "https://pictureis24-a.akamaihd.net/pic/orig02/N/278/959/437/278959437-0.jpg/ORIG/resize/600x400/format/jpg"), Image(id: 4, url: "https://pictureis24-a.akamaihd.net/pic/orig04/N/278/959/419/278959419-0.jpg/ORIG/resize/600x400/format/jpg")], location: Location(address: "Bergmannstraße 33, 10961 Berlin", cordinates: CLLocation(latitude: CLLocationDegrees(exactly: 52.488886876519175)!, longitude: CLLocationDegrees(exactly: 13.397688051882763)!)) ))
        cellTest(detailItemCell)
    }
    
    // MARK: - private tests
    
    private func cellTest(_ cell: DetailItemCell) {
        XCTAssertNotNil(cell)
    }
    
}

