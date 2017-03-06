//
//  PushedPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - PushedPage
public protocol PushedPage: AutoMate.PushedPage {
}

// MARK: Default implementation
/// Default implementation of the `PushedPage` protocol.
public extension PushedPage {

    // MARK: Elements
    public var backButton: XCUIElement {
        return view.buttons[Locators.backButton]
    }
}

// MARK: - Locators
private enum Locators: String, Locator {
    case backButton = "Back"
}
