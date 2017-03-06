//
//  HealthPermissionPage.swift
//  AutoMate
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - HealthPermissionPage
open class HealthPermissionPage: BaseAppPage, HealthAlertAllow, HealthAlertDeny, HealthAlertTurnOnAll, HealthAlertTurnOffAll {

    // MARK: Elements
    open var healthAccessElement: XCUIElement {
        return view.navigationBars[Locators.healthAccess]
    }
}

// MARK: - IdentifiableByElement
extension HealthPermissionPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return healthAccessElement
    }
}

// MARK: - Locators
public extension HealthPermissionPage {

    public enum Locators: String, Locator {
        case healthAccess = "Health Access"
    }
}

// MARK: - Health protocols
// Health alert Allow element
public protocol HealthAlertAllow {
    /// Allow messages
    static var allow: [String] { get }
    /// Allow element
    var allowElement: XCUIElement { get }
}

// Health alert Deny element
public protocol HealthAlertDeny {
    /// Deny messages
    static var deny: [String] { get }
    /// Deny element
    var denyElement: XCUIElement { get }
}

// Health alert Turn On All element
public protocol HealthAlertTurnOnAll {
    /// Turn On All messages
    static var turnOnAll: [String] { get }
    /// Turn On All element
    var turnOnAllElement: XCUIElement { get }
}

// Health alert Turn Off All element
public protocol HealthAlertTurnOffAll {
    /// Turn Off All messages
    static var turnOffAll: [String] { get }
    /// Turn Off All element
    var turnOffAllElement: XCUIElement { get }
}

// MARK: - Default implementation
extension HealthAlertAllow where Self: BaseAppPage {
    public var allowElement: XCUIElement {
        guard let button = view.buttons.elements(withLabelsMatching: type(of: self).allow).first else {
            preconditionFailure("Cannot find allow button.")
        }

        return button
    }
}

extension HealthAlertDeny where Self: BaseAppPage {
    public var denyElement: XCUIElement {
        guard let button = view.buttons.elements(withLabelsMatching: type(of: self).deny).first else {
            preconditionFailure("Cannot find deny button.")
        }

        return button
    }
}

extension HealthAlertTurnOnAll where Self: BaseAppPage {
    public var turnOnAllElement: XCUIElement {
        guard let button = view.staticTexts.elements(withLabelsMatching: type(of: self).turnOnAll).first else {
            preconditionFailure("Cannot find turn on all button.")
        }

        return button
    }
}

extension HealthAlertTurnOffAll where Self: BaseAppPage {
    public var turnOffAllElement: XCUIElement {
        guard let button = view.staticTexts.elements(withLabelsMatching: type(of: self).turnOffAll).first else {
            preconditionFailure("Cannot find turn off all button.")
        }

        return button
    }
}
