//
//  ScrollView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - ScrollView
open class ScrollView: BaseAppView, PushedView {

    // MARK: Elements
    open var topButton: XCUIElement {
        return view.buttons[Locators.topButton]
    }

    open var middleButton1: XCUIElement {
        return view.buttons[Locators.middleButton1]
    }

    open var middleButton2: XCUIElement {
        return view.buttons[Locators.middleButton2]
    }

    open var bottomButton: XCUIElement {
        return view.buttons[Locators.bottomButton]
    }

    open var textField: XCUIElement {
        return view.textFields[Locators.textField]
    }

    open var scrollView: XCUIElement {
        return view.scrollViews[Locators.scrollView]
    }

    // MARK: Helpers
    open func isTopButtonDisplayed() -> Bool {
        return topButton.isVisible
    }

    open func isMiddleButton1Displayed() -> Bool {
        return middleButton1.isVisible
    }

    open func isMiddleButton2Displayed() -> Bool {
        return middleButton2.isVisible
    }

    open func isBottomButtonDisplayed() -> Bool {
        return bottomButton.isVisible
    }
}

// MARK: - Locators
private extension ScrollView {

    enum Locators: String, Locator {
        case scrollView
        case textField
        case topButton
        case middleButton1
        case middleButton2
        case bottomButton
    }
}
