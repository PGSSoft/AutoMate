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

    // MARK: Arrange View Objects
    lazy var mainView: MainView = MainView(in: self.app)
    lazy var textInputView: TextInputView = TextInputView(in: self.app)
    lazy var scrollView: ScrollView = ScrollView(in: self.app)
    lazy var middleButtonView: MiddleButtonView = MiddleButtonView(in: self.app)
    lazy var locationView: LocationView = LocationView(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configure(app).launch()
        wait(forVisibilityOf: mainView)
    }

    
    // MARK: Tests
    func testIsVisible() {
        mainView.goToScrollViewMenu()

        XCTAssertFalse(scrollView.bottomButton.isVisible)
        scrollView.bottomButton.tap()
        XCTAssertTrue(scrollView.bottomButton.isVisible)
    }

    func testSimpleSwipe() {
        mainView.goToScrollViewMenu()

        XCTAssertTrue(scrollView.isTopButtonDisplayed())
        scrollView.scrollView.swipe(from: CGVector(dx: 0.5, dy: 0.9), to: CGVector(dx: 0.5, dy: 0.1))
        XCTAssertFalse(scrollView.isTopButtonDisplayed())
    }

    func testComplexSwipe() {
        mainView.goToScrollViewMenu()

        XCTAssertTrue(scrollView.isTopButtonDisplayed() && !scrollView.isBottomButtonDisplayed())

        scrollView.scrollView.swipe(to: scrollView.bottomButton)
        XCTAssertFalse(scrollView.isTopButtonDisplayed() && scrollView.isBottomButtonDisplayed())
        scrollView.bottomButton.tap()

        scrollView.scrollView.swipe(to: scrollView.topButton)
        XCTAssertTrue(scrollView.isTopButtonDisplayed() && !scrollView.isBottomButtonDisplayed())
        scrollView.topButton.tap()
    }

    func testComplexSwipeWithKeyboard() {
        mainView.goToScrollViewMenu()

        scrollView.textField.tap()
        scrollView.textField.typeText("AutoMate")

        XCTAssertTrue(scrollView.isTopButtonDisplayed() && !scrollView.isMiddleButton1Displayed() && !scrollView.isMiddleButton2Displayed())

        scrollView.scrollView.swipe(to: scrollView.middleButton1)
        XCTAssertTrue(scrollView.isMiddleButton1Displayed())

        scrollView.scrollView.swipe(to: scrollView.middleButton2)
        XCTAssertTrue(scrollView.isMiddleButton2Displayed())

        scrollView.scrollView.swipe(to: scrollView.middleButton1)
        XCTAssertTrue(scrollView.isMiddleButton1Displayed())
    }

    func testClearTextField() {
        mainView.goToTextInputMenu()

        textInputView.textField.tap()
        textInputView.textField.typeText("Made with love by PGS")
        XCTAssertEqual(textInputView.textFieldValue(), "Made with love by PGS")
        textInputView.textField.clearTextField()
        XCTAssertEqual(textInputView.textFieldValue(), "")
    }

    func testClearAndType() {
        mainView.goToTextInputMenu()

        textInputView.textField.tap()
        textInputView.textField.typeText("Made with love")
        XCTAssertEqual(textInputView.textFieldValue(), "Made with love")
        textInputView.textField.clear(andType: "by PGS")
        XCTAssertEqual(textInputView.textFieldValue(), "by PGS")
    }

    func testTapWithOffset() {
        mainView.goToMiddleButtonMenu()
        XCTAssertFalse(middleButtonView.isLabelDisplayed())

        // tap cell by using offset only
        app.tap(withOffset: CGVector(dx: 0.5, dy: 0.5))
        // cell pushed view controller, title no longer visible

        XCTAssertTrue(middleButtonView.isLabelDisplayed())
    }

    /// This test relies on permission being cleared before starting the test. This is currently done in "Run script" build phase.
    func testSystemAlertButton() {
        mainView.goToLocationMenu()

        addUIInterruptionMonitor(withDescription: "Location") { (element) -> Bool in
            element.tapLeftButtonOnSystemAlert()
            return true
        }

        // interruption won't happen without some kind of action
        app.tap()

        wait(forExistOf: locationView.deniedPermissionLabel)
    }

    // MARK: Test for movie
    func testForMovie() {
        testClearAndType()
        textInputView.goBack()

        testTapWithOffset()
        middleButtonView.goBack()

//        testSystemAlertButton()
//        locationView.goBack()
    }
}
