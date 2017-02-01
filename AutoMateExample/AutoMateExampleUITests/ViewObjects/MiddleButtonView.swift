//
//  MiddleButtonView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - MiddleButtonView
open class MiddleButtonView: BaseAppView, PushedView {

    // MARK: Elements
    open var label: XCUIElement {
        return view.staticTexts[Locators.label]
    }

    open var button: XCUIElement {
        return view.buttons[Locators.button]
    }

    // MARK: Helpers
    open func isLabelDisplayed() -> Bool {
        return label.isVisible
    }
}

// MARK: - Locators
private extension MiddleButtonView {

    enum Locators: String, Locator {
        case label
        case button
    }
}
