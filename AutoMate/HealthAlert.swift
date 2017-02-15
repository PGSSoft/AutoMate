//
//  HealthAlert.swift
//  AutoMate
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - Health protocols
public protocol HealthAlertAllow: SystemAlertAllow { }
public protocol HealthAlertDeny: SystemAlertDeny { }

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
extension HealthAlertTurnOnAll where Self: SystemAlert {
    public var turnOnAllElement: XCUIElement {
        guard let button = alert.buttons.elements(withLabelsMatching: type(of: self).turnOnAll).first else {
            preconditionFailure("Cannot find turn on all button.")
        }

        return  button
    }
}

extension HealthAlertTurnOffAll where Self: SystemAlert {
    public var turnOffAllElement: XCUIElement {
        guard let button = alert.buttons.elements(withLabelsMatching: type(of: self).turnOffAll).first else {
            preconditionFailure("Cannot find turn off all button.")
        }

        return  button
    }
}
