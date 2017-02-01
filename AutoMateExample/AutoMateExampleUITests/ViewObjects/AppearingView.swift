//
//  AppearingView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - AppearingView
open class AppearingView: BaseAppView, PushedView {

    // MARK: Elements
    open var button: XCUIElement {
        return view.buttons[Locators.appearingButton]
    }

    open var madeWithLoveView: XCUIElement {
        return view.any[Locators.madeWithLoveView]
    }

    // MARK: Actions
    open func tapOnButton() {
        button.tap()
    }

    // MARK: Helpers
    open func isButtonDisplayed() -> Bool {
        return button.isVisible
    }

    open func isMadeWithLoveViewDisplayed() -> Bool {
        return madeWithLoveView.isVisible
    }
}

// MARK: - Locators
private extension AppearingView {

    enum Locators: String, Locator {
        case appearingButton
        case madeWithLoveView
    }
}
