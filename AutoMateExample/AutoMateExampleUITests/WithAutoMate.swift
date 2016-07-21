//
//  AutoMateExampleUITests.swift
//  AutoMateExampleUITests
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class WithAutomate: XCTestCase {

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        let app = XCUIApplication()
        let launcher = TestLauncher(options: [
            SystemLanguageArgument([.Polish]),
            SystemLocaleArgument(language: .Polish, country: .Poland),
            SystemKeyboardArgument(
                software: SystemSoftwareKeyboardArgument([.PolishPoland]),
                hardware: SystemHardwareKeyboardArgument([.PolishPoland])
            )
        ])
        launcher.configure(app)
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
