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
    lazy var mainScreen: MainScreen = MainScreen(app: self.app)

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
        wait(forExistOf: mainScreen.tableView, timeout: 30)
    }

    // MARK: XCTestCase extension tests
    func testWaitForElementToExist() {
        let screen = AppearingScreen.open(inside: app)

        wait(forVisabilityOf: screen.appearingButton)
        XCTAssertFalse(screen.madeWithLoveView.exists)
        screen.appearingButton.tap()
        wait(forExistOf: screen.madeWithLoveView)
    }

    func testWaitForVisibleElement() {
        let screen = AppearingScreen.open(inside: app)
        XCTAssertFalse(screen.appearingButton.isVisible)

        wait(forVisabilityOf: screen.appearingButton)
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
