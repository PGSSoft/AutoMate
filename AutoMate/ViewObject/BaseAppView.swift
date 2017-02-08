//
//  BaseAppView.swift
//  AutoMate
//
//  Created by Bartosz Janda on 31.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - BaseAppViewProtocol
/// Base view object protocol. Defines basic properties and methods required by all view objects,
public protocol BaseAppViewProtocol {

    // MARK: Properties
    /// The container view on which all elements will be placed.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    var view: XCUIElement { get }
}

// MARK: - BaseAppView
/// Base implementation of the `BaseAppViewProtocol`. All view objects can inherit from this class.
open class BaseAppView: BaseAppViewProtocol {

    // MARK: Properties
    /// The container view on which all elements will be placed.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    open var view: XCUIElement

    // MARK: Initialization
    /// Initialize View Object with container view
    ///
    /// - Parameter view: Container view which contains all its view object elements.
    ///
    /// - note:
    /// This view can be an instance of `XCUIApplication` class.
    public init(in view: XCUIElement) {
        self.view = view
    }
}
