//
//  XCUIElementExtensionTests.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 17/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class AdditionalExtensionsTests: XCTestCase {
    let app = XCUIApplication()

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
    }

    // MARK: XCTestCase extension tests
    func testWaitForElementToExist() {
        let screen = AppearingScreen.open(inside: app)

        wait(forVisibleElement: screen.appearingButton)
        XCTAssertFalse(screen.madeWithLoveView.exists)
        screen.appearingButton.tap()
        wait(forElementToExist: screen.madeWithLoveView)
    }

    func testWaitForVisibleElement() {
        let screen = AppearingScreen.open(inside: app)
        XCTAssertFalse(screen.appearingButton.isVisible)

        wait(forVisibleElement: screen.appearingButton)
        XCTAssertTrue(screen.appearingButton.isVisible)
        screen.appearingButton.tap()
    }

    // MARK: XCUIApplication extension tests
    func testDeviceType() {
        print(
            app.deviceType,
            app.actualDeviceType,
            app.isRunningOnSimulator,
            app.isRunningOn(.iPad),
            app.isRunningOn(.iPhone40),
            app.isRunningOnIpad,
            app.isRunningOnIphone)
    }

    // MARK: XCUIElementTypeQueryProvider tests
    func testAny() {
        XCTAssertTrue(app.any.element(boundBy: 0).exists)
    }

    // MARK: Test for movie
    func testForMovie() {
        testWaitForElementToExist()
        AppearingScreen.closeView(in: app)
    }
}
