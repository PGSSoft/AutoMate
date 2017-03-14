//
//  LaunchArgumentsWithoutAutoMateTests.swift
//  LaunchArgumentsWithoutAutoMateTests
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest

class LaunchArgumentsWithoutAutoMateTests: XCTestCase {

    // MARK: Setup
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

    // MARK: Tests
    func testSomething() {

    }
}
