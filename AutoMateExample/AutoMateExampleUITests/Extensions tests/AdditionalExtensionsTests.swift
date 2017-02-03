//
//  AdditionalExtensionsTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class AdditionalExtensionsTests: AppUITestCase {

    // MARK: Arrange View Objects
    lazy var mainView: MainView = MainView(in: self.app)
    lazy var appearingView: AppearingView = AppearingView(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainView)
    }

    // MARK: XCTestCase extension tests
    func testWaitForElementToExist() {
        mainView.goToAppearingMenu()

        wait(forVisibilityOf: appearingView.button)
        XCTAssertFalse(appearingView.isMadeWithLoveViewDisplayed())
        appearingView.tapOnButton()
        wait(forExistOf: appearingView.madeWithLoveView)
    }

    func testWaitForVisibleElement() {
        mainView.goToAppearingMenu()

        XCTAssertFalse(appearingView.isButtonDisplayed())

        wait(forVisibilityOf: appearingView.button)
        XCTAssertTrue(appearingView.isButtonDisplayed())
        appearingView.tapOnButton()
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
        appearingView.goBack()
    }
}
