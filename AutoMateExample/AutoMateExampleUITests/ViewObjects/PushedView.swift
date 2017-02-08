//
//  PushedView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - PushedView
public protocol PushedView: AutoMate.PushedView {
}

// MARK: Default implementation
/// Default implementation of the `PushedView` protocol.
public extension PushedView {

    // MARK: Elements
    public var backButton: XCUIElement {
        return view.buttons[Locators.backButton]
    }
}

// MARK: - Locators
private enum Locators: String, Locator {
    case backButton = "Test views"
}
