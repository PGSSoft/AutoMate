//
//  PushedPage.swift
//  AutoMate
//
//  Created by Bartosz Janda on 31.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - PushedPage protocol
/// Page object protocol describing behaviour of pushed.
/// Default implementation use "back" `accessibilityIdentifier`.
///
/// Example usage:
/// ```swift
/// class AboutTheAppView: BaseAppPage, PushedPage {}
///
/// let aboutTheAppView = AboutTheAppView(view: containerView)
/// aboutTheAppView.goBack()
/// ```
///
/// - requires:
/// It is required to use "back" as `accessibilityIdentifier` in custom back button in the application to work with default implementation of this protocol.
public protocol PushedPage: BaseAppPageProtocol {

    // MARK: Elements
    /// Back button element.
    var backButton: XCUIElement { get }

    // MARK: Actions
    // Pop view action.
    func goBack()
}

// MARK: Default implementation
/// Default implementation of the `PushedPage` protocol.
public extension PushedPage {

    // MARK: Elements
    public var backButton: XCUIElement {
        return view.buttons[Locators.backButton]
    }

    // MARK: Actions
    public func goBack() {
        backButton.tap()
    }
}

// MARK: - Locators
private enum Locators: String, Locator {
    case backButton = "back"
}
