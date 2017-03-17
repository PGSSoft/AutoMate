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

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var appearingPage: AppearingPage = AppearingPage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainPage)
    }

    // MARK: XCTestCase extension tests
    func testWaitForElementToExist() {
        mainPage.goToAppearingMenu()

        wait(forVisibilityOf: appearingPage.button)
        XCTAssertFalse(appearingPage.isMadeWithLoveViewDisplayed())
        appearingPage.tapOnButton()
        wait(forExistanceOf: appearingPage.madeWithLoveView)
    }

    func testWaitForVisibleElement() {
        mainPage.goToAppearingMenu()

        XCTAssertFalse(appearingPage.isButtonDisplayed())

        wait(forVisibilityOf: appearingPage.button)
        XCTAssertTrue(appearingPage.isButtonDisplayed())
        appearingPage.tapOnButton()
    }

    func testWaitForDisappearElement() {
        mainPage.goToAppearingMenu()

        wait(forVisibilityOf: appearingPage.button)
        appearingPage.tapOnButton()

        wait(forVisibilityOf: appearingPage.activityIndicator)

        wait(forInvisibilityOf: appearingPage.activityIndicator)
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
}
