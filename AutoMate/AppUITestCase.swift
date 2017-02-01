//
//  AppUITestCase.swift
//  AutoMate
//
//  Created by Bartosz Janda on 31.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

/// Every call to XCUIApplication creates new instance of the XCUIApplication object.
/// This is why the XCUIApplication object is created at the beginning of the test and stored in the `app` variable.

// MARK: - AppUITestCase
open class AppUITestCase: XCTestCase {

    // MARK: Properties
    open var app: XCUIApplication!

    // MARK: Methods
    override open func setUp() {
        super.setUp()
        app = XCUIApplication()
        continueAfterFailure = false
    }

    override open func tearDown() {
        app = nil
        super.tearDown()
    }
}
