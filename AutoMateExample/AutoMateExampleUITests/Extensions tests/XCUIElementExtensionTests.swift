//
//  XCUIElementExtensionTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class XCUIElementExtensionTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var textInputPage: TextInputPage = TextInputPage(in: self.app)
    lazy var scrollPage: ScrollPage = ScrollPage(in: self.app)
    lazy var middleButtonPage: MiddleButtonPage = MiddleButtonPage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainPage)
    }

    // MARK: Tests
    func testIsVisible() {
        mainPage.goToScrollPageMenu()

        XCTAssertFalse(scrollPage.bottomButton.isVisible)
        scrollPage.bottomButton.tap()
        XCTAssertTrue(scrollPage.bottomButton.isVisible)
    }

    func testSimpleSwipe() {
        mainPage.goToScrollPageMenu()

        XCTAssertTrue(scrollPage.isTopButtonDisplayed())
        scrollPage.scrollView.swipe(from: CGVector(dx: 0.5, dy: 0.9), to: CGVector(dx: 0.5, dy: 0.1))
        XCTAssertFalse(scrollPage.isTopButtonDisplayed())
    }

    func testComplexSwipe() {
        mainPage.goToScrollPageMenu()

        XCTAssertTrue(scrollPage.isTopButtonDisplayed() && !scrollPage.isBottomButtonDisplayed())

        scrollPage.scrollView.swipe(to: scrollPage.bottomButton)
        XCTAssertFalse(scrollPage.isTopButtonDisplayed() && scrollPage.isBottomButtonDisplayed())
        scrollPage.bottomButton.tap()

        scrollPage.scrollView.swipe(to: scrollPage.topButton)
        XCTAssertTrue(scrollPage.isTopButtonDisplayed() && !scrollPage.isBottomButtonDisplayed())
        scrollPage.topButton.tap()
    }

    func testComplexSwipeWithKeyboard() {
        mainPage.goToScrollPageMenu()

        scrollPage.textField.tap()
        scrollPage.textField.typeText("AutoMate")

        XCTAssertTrue(scrollPage.isTopButtonDisplayed() && !scrollPage.isMiddleButton1Displayed() && !scrollPage.isMiddleButton2Displayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton1)
        XCTAssertTrue(scrollPage.isMiddleButton1Displayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton2)
        XCTAssertTrue(scrollPage.isMiddleButton2Displayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton1)
        XCTAssertTrue(scrollPage.isMiddleButton1Displayed())
    }

    func testClearTextField() {
        mainPage.goToTextInputMenu()

        textInputPage.textField.tap()
        textInputPage.textField.typeText("Made with love by PGS")
        XCTAssertEqual(textInputPage.textFieldValue(), "Made with love by PGS")
        textInputPage.textField.clearTextField()
        XCTAssertEqual(textInputPage.textFieldValue(), "")
    }

    func testClearAndType() {
        mainPage.goToTextInputMenu()

        textInputPage.textField.tap()
        textInputPage.textField.typeText("Made with love")
        XCTAssertEqual(textInputPage.textFieldValue(), "Made with love")
        textInputPage.textField.clear(andType: "by PGS")
        XCTAssertEqual(textInputPage.textFieldValue(), "by PGS")
    }

    func testTapWithOffset() {
        mainPage.goToMiddleButtonMenu()
        XCTAssertFalse(middleButtonPage.isLabelDisplayed())

        // tap cell by using offset only
        app.tap(withOffset: CGVector(dx: 0.5, dy: 0.5))
        // cell pushed view controller, title no longer visible

        XCTAssertTrue(middleButtonPage.isLabelDisplayed())
    }

    // MARK: Test for movie
    func testForMovie() {
        testClearAndType()
        textInputPage.goBack()

        testTapWithOffset()
        middleButtonPage.goBack()

//        testSystemAlertButton()
//        locationView.goBack()
    }
}
