//
//  AutoMateExampleUITests.swift
//  AutoMateExampleUITests
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest


class WithoutAutoMate: XCTestCase {

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = [
            "-AppleLanguages", "(\"pl\")",
            "-AppleLocale", "\"pl_PL\"",
            "-AppleKeyboards", "(\"pl_PL@sw=QWERTY\", \"pl_PL@hw=Polish Pro\")"
        ]
        app.launch()
    }

    // MARK: - Tests
    func testViewController() {
        let app = XCUIApplication()
        let textView = app.textViews["input-text-view"]
        let counter = app.staticTexts["counter-label"]

        textView.tap()

        XCTAssertEqual(counter.label, "0")

        textView.typeText("a")
        XCTAssertEqual(counter.label, "1")

        textView.typeText("a")
        XCTAssertEqual(counter.label, "2")
    }
}
