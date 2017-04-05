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
    lazy var scrollVerticallyPage: ScrollVerticallyPage = ScrollVerticallyPage(in: self.app)
    lazy var middleButtonPage: MiddleButtonPage = MiddleButtonPage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainPage)
    }

    // MARK: Tests
    func testIsVisible() {
        mainPage.goToScrollMenu()

        XCTAssertFalse(scrollPage.bottomButton.isVisible)
        scrollPage.bottomButton.tap()
        XCTAssertTrue(scrollPage.bottomButton.isVisible)
    }

    func testSimpleSwipe() {
        mainPage.goToScrollMenu()

        XCTAssertTrue(scrollPage.isTopButtonDisplayed())
        scrollPage.scrollView.swipe(from: CGVector(dx: 0.5, dy: 0.9), to: CGVector(dx: 0.5, dy: 0.1))
        XCTAssertFalse(scrollPage.isTopButtonDisplayed())
    }

    func testComplexSwipe() {
        mainPage.goToScrollMenu()

        XCTAssertTrue(scrollPage.isTopButtonDisplayed())
        XCTAssertFalse(scrollPage.isBottomButtonDisplayed())

        scrollPage.scrollView.swipe(to: scrollPage.bottomButton)
        XCTAssertFalse(scrollPage.isTopButtonDisplayed())
        XCTAssertTrue(scrollPage.isBottomButtonDisplayed())
        scrollPage.bottomButton.tap()

        scrollPage.scrollView.swipe(to: scrollPage.topButton)
        XCTAssertTrue(scrollPage.isTopButtonDisplayed())
        XCTAssertFalse(scrollPage.isBottomButtonDisplayed())
        scrollPage.topButton.tap()
    }

    func testComplexSwipeWithKeyboard() {
        mainPage.goToScrollMenu()

        scrollPage.textField.tap()
        scrollPage.textField.typeText("AutoMate")

        XCTAssertTrue(scrollPage.isTopButtonDisplayed())
        XCTAssertFalse(scrollPage.isMiddleButton1Displayed())
        XCTAssertFalse(scrollPage.isMiddleButton2Displayed())
        XCTAssertFalse(scrollPage.isBottomButtonDisplayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton1)
        XCTAssertTrue(scrollPage.isMiddleButton1Displayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton2)
        XCTAssertTrue(scrollPage.isMiddleButton2Displayed())

        scrollPage.scrollView.swipe(to: scrollPage.middleButton1)
        XCTAssertTrue(scrollPage.isMiddleButton1Displayed())
    }

    // swiftlint:disable:next function_body_length
    func testVerticalSwipe() {
        mainPage.goToScrollVerticallyMenu()

        XCTAssertTrue(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.middleButton)
        XCTAssertFalse(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertTrue(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.bottomLeftButton)
        XCTAssertFalse(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertTrue(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.bottomRightButton)
        XCTAssertFalse(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertTrue(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.middleButton)
        XCTAssertFalse(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertTrue(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.topRightButton)
        XCTAssertFalse(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertTrue(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())

        scrollVerticallyPage.scrollView.swipe(to: scrollVerticallyPage.topLeftButton)
        XCTAssertTrue(scrollVerticallyPage.isTopLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isTopRightButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isMiddleButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomLeftButtonDisplayed())
        XCTAssertFalse(scrollVerticallyPage.isBottomRightButtonDisplayed())
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
}
