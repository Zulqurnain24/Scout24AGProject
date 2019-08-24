//
//  PaletteTest.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

@testable import Scout24AGProject

class PaletteTest: XCTestCase {
    
    func testBlack() {
        XCTAssertEqual(Palette.black.color, UIColor.rgb(red: 0, green: 0, blue: 0))
    }

    func testBlue() {
        XCTAssertEqual(Palette.blue.color, UIColor.rgb(red: 0, green: 122, blue: 255))
    }
    
    func testClear() {
        XCTAssertEqual(Palette.clear.color, UIColor.clear)
    }
    
    func testDarkPurple() {
        XCTAssertEqual(Palette.darkPurple.color, UIColor.rgb(red: 48, green: 35, blue: 174))
    }
    
    func testError() {
        XCTAssertEqual(Palette.error.color, UIColor.rgb(red: 218, green: 54, blue: 22))
    }
    
    func testGold() {
        XCTAssertEqual(Palette.gold.color, UIColor.rgb(red: 223, green: 201, blue: 136))
    }
    
    func testGray1() {
        XCTAssertEqual(Palette.gray1.color, UIColor.rgb(red: 242, green: 242, blue: 242))
    }
    
    func testGray2() {
        XCTAssertEqual(Palette.gray2.color, UIColor.rgb(red: 204, green: 204, blue: 204))
    }
    
    func testGray3() {
        XCTAssertEqual(Palette.gray3.color, UIColor.rgb(red: 143, green: 143, blue: 143))
    }
    
    func testGray4() {
        XCTAssertEqual(Palette.gray4.color, UIColor.rgb(red: 100, green: 100, blue: 100))
    }
    
    func testGray5() {
        XCTAssertEqual(Palette.gray5.color, UIColor.rgb(red: 51, green: 51, blue: 51))
    }
    
    func testGreen() {
        XCTAssertEqual(Palette.green.color, UIColor.rgb(red: 30, green: 241, blue: 161))
    }
    
    func testLightPurple() {
        XCTAssertEqual(Palette.lightPurple.color, UIColor.rgb(red: 200, green: 109, blue: 215))
    }
    
    func testOrange() {
        XCTAssertEqual(Palette.orange.color, UIColor.rgb(red: 244, green: 147, blue: 66))
    }
    
    func testPurple() {
        XCTAssertEqual(Palette.purple.color, UIColor.rgb(red: 130, green: 67, blue: 213))
    }
    
    func testRaspberry() {
        XCTAssertEqual(Palette.raspberry.color, UIColor.rgb(red: 211, green: 54, blue: 122))
    }
    
    func testRed() {
        XCTAssertEqual(Palette.red.color, UIColor.rgb(red: 255, green: 0, blue: 0))
    }
    
    func testRose() {
        XCTAssertEqual(Palette.rose.color, UIColor.rgb(red: 226, green: 123, blue: 139))
    }
    
    func testSuccess() {
        XCTAssertEqual(Palette.success.color, UIColor.rgb(red: 80, green: 184, blue: 60))
    }
    
    func testTeal() {
        XCTAssertEqual(Palette.teal.color, UIColor.rgb(red: 0, green: 175, blue: 205))
    }
    
    func testWhite() {
        XCTAssertEqual(Palette.white.color, UIColor.rgb(red: 255, green: 255, blue: 255))
    }
    
}
