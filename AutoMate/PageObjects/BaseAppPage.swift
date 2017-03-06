//
//  BaseAppPage.swift
//  AutoMate
//
//  Created by Bartosz Janda on 31.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - BaseAppPageProtocol
/// Base page object protocol. Defines basic properties and methods required by all page objects.
public protocol BaseAppPageProtocol {

    // MARK: Properties
    /// The container view on which all elements will be placed.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    var view: XCUIElement { get }
}

// MARK: - BaseAppPage
/// Base implementation of the `BaseAppPageProtocol`. All page objects can inherit from this class.
open class BaseAppPage: BaseAppPageProtocol {

    // MARK: Properties
    /// The container view on which all elements will be placed.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    open var view: XCUIElement

    // MARK: Initialization
    /// Initialize Page Object with container view
    ///
    /// - Parameter view: Container view which contains all its page object elements.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    public init(in view: XCUIElement) {
        self.view = view
    }
}
