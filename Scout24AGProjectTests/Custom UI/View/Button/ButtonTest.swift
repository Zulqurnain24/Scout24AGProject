//
//  ButtonTest.swift
//  Scout24AGProject
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import Scout24AGProject

class ButtonTest: XCTestCase {

    func testBlueWhiteSmall() {
        let button = Button(style: .orangeWhiteLarge, text: "test")
        button.backgroundColor = Palette.white.color
        textTest(button, "test")
        backgroundTest(button, .white)
        sizeTest(button, .buttonSmall)
        imageTest(button,  image: #imageLiteral(resourceName: "blue"))
    }
    
    // MARK: - private tests

    private func imageTest(_ button: Button,  image: UIImage) {
        XCTAssertEqual(image, #imageLiteral(resourceName: "blue"))
    }
    
    private func textTest(_ button: Button, _ text: String) {
        XCTAssertEqual(button.titleLabel?.text, "test")
    }

    private func backgroundTest(_ button: Button, _ color: Palette) {
        XCTAssertEqual(button.backgroundColor, color.color)
    }
    
    private func borderTest(_ button: Button, _ color: Palette) {
        XCTAssertEqual(button.layer.borderColor, color.color.cgColor)
        XCTAssertEqual(button.layer.cornerRadius, 4)
        XCTAssertEqual(button.layer.borderWidth, 1)
        XCTAssertTrue(button.clipsToBounds)
    }
    
    private func sizeTest(_ button: Button, _ size: Typography) {
        switch size {
        case .buttonXL:
            XCTAssertEqual(button.frame, CGRect(x: 0, y: 0, width: 345, height: 44))
            XCTAssertEqual(button.titleLabel?.font, Typography.buttonXL.font)
        case .buttonLarge:
            XCTAssertEqual(button.frame, CGRect(x: 0, y: 0, width: 345, height: 44))
            XCTAssertEqual(button.titleLabel?.font, Typography.buttonLarge.font)
        default: break
        }
    }
    
}
