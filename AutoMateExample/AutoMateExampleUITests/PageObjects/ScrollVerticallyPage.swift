//
//  ScrollVerticallyPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 05.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - ScrollVerticallyPage
open class ScrollVerticallyPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var scrollView: XCUIElement {
        return view.scrollViews[Locators.scrollView]
    }

    open var topLeftButton: XCUIElement {
        return scrollView.buttons[Locators.topLeftButton]
    }

    open var topRightButton: XCUIElement {
        return scrollView.buttons[Locators.topRightButton]
    }

    open var middleButton: XCUIElement {
        return scrollView.buttons[Locators.middleButton]
    }

    open var bottomLeftButton: XCUIElement {
        return scrollView.buttons[Locators.bottomLeftButton]
    }

    open var bottomRightButton: XCUIElement {
        return scrollView.buttons[Locators.bottomRightButton]
    }

    // MARK: Helpers
    open func isTopLeftButtonDisplayed() -> Bool {
        return topLeftButton.isVisible
    }

    open func isTopRightButtonDisplayed() -> Bool {
        return topRightButton.isVisible
    }

    open func isMiddleButtonDisplayed() -> Bool {
        return middleButton.isVisible
    }

    open func isBottomLeftButtonDisplayed() -> Bool {
        return bottomLeftButton.isVisible
    }

    open func isBottomRightButtonDisplayed() -> Bool {
        return bottomRightButton.isVisible
    }
}

// MARK: - Locators
private extension ScrollVerticallyPage {

    enum Locators: String, Locator {
        case scrollView
        case topLeftButton
        case topRightButton
        case middleButton
        case bottomLeftButton
        case bottomRightButton
    }
}
