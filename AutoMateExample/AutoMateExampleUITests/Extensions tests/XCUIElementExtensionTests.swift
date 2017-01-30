//
//  XCUIElementExtensionTests.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 17/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class XCUIElementExtensionTests: XCTestCase {
    let app = XCUIApplication()
    lazy var mainScreen: MainScreen = MainScreen(app: self.app)

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
        wait(forExistOf: mainScreen.tableView, timeout: 30)
    }

    // MARK: Tests
    func testIsVisible() {
        let screen = ScrollViewScreen.open(inside: app)

        XCTAssertFalse(screen.buttonBottom.isVisible)
        screen.buttonBottom.tap()
        XCTAssertTrue(screen.buttonBottom.isVisible)
    }

    func testSimpleSwipe() {
        let screen = ScrollViewScreen.open(inside: app)

        XCTAssertTrue(screen.buttonTop.isHittable)
        screen.scrollView.swipe(from: CGVector(dx: 0.5, dy: 0.9), to: CGVector(dx: 0.5, dy: 0.1))
        XCTAssertFalse(screen.buttonTop.isHittable)
    }

    func testComplexSwipe() {
        let screen = ScrollViewScreen.open(inside: app)

        XCTAssertTrue(screen.buttonTop.isHittable && !screen.buttonBottom.isHittable)

        screen.scrollView.swipe(to: screen.buttonBottom)
        XCTAssertFalse(screen.buttonTop.isHittable && screen.buttonBottom.isHittable)
        screen.buttonBottom.tap()

        screen.scrollView.swipe(to: screen.buttonTop)
        XCTAssertTrue(screen.buttonTop.isHittable && !screen.buttonBottom.isHittable)
        screen.buttonTop.tap()
    }

    func testComplexSwipeWithKeyboard() {
        let screen = ScrollViewScreen.open(inside: app)
        screen.textField.tap()
        screen.textField.typeText("AutoMate")

        XCTAssertTrue(screen.buttonTop.isHittable && !screen.buttonMiddle1.isHittable && !screen.buttonMiddle2.isHittable)

        screen.scrollView.swipe(to: screen.buttonMiddle1)
        XCTAssertTrue(screen.buttonMiddle1.isHittable)

        screen.scrollView.swipe(to: screen.buttonMiddle2)
        XCTAssertTrue(screen.buttonMiddle2.isHittable)

        screen.scrollView.swipe(to: screen.buttonMiddle1)
        XCTAssertTrue(screen.buttonMiddle1.isHittable)
    }

    func testClearTextField() {
        let screen = TextInputScreen.open(inside: app)

        screen.textField.tap()
        screen.textField.typeText("Made with love by PGS")
        XCTAssertEqual(screen.textField.value as? String, "Made with love by PGS")
        screen.textField.clearTextField()
        XCTAssertEqual(screen.textField.value as? String, "")
    }

    func testClearAndType() {
        let screen = TextInputScreen.open(inside: app)

        screen.textField.tap()
        screen.textField.typeText("Made with love")
        XCTAssertEqual(screen.textField.value as? String, "Made with love")
        screen.textField.clear(andType: "by PGS")
        XCTAssertEqual(screen.textField.value as? String, "by PGS")
    }

    func testTapWithOffset() {
        let screen = MiddleButtonScreen.open(inside: app)
        XCTAssertFalse(screen.label.exists)

        // tap cell by using offset only
        app.tap(withOffset: CGVector(dx: 0.5, dy: 0.5))
        // cell pushed view controller, title no longer visible

        XCTAssertTrue(screen.label.exists)
    }

    /// This test relies on permission being cleared before starting the test. This is currently done in "Run script" build phase.
    func testSystemAlertButton() {
        let screen = LocationScreen.open(inside: app)
        addUIInterruptionMonitor(withDescription: "Location") { (element) -> Bool in
            element.tapLeftButtonOnSystemAlert()
            return true
        }

        // interruption won't happen without some kind of action
        app.tap()

        wait(forExistOf: screen.deniedLabel)
    }

    // MARK: Test for movie
    func testForMovie() {
        testClearAndType()
        TextInputScreen.closeView(in: app)

        testTapWithOffset()
        MiddleButtonScreen.closeView(in: app)

//        testSystemAlertButton()
//        LocationScreen.closeView(in: app)
    }
}
