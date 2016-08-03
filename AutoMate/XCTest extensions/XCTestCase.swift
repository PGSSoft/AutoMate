//
//  XCTestCase.swift
//  AutoMate
//
//  Created by Pawel Szot on 03/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

public extension XCTestCase {

    // MARK: Methods
    /**
     Wait for an UI element to exist in a view hierarchy. After given interval, if element is not found, test fails.

     - parameter element: XCUIElement to wait for.
     - parameter timeout: waiting time (default: 10 seconds)
     - parameter file: current source file
     - parameter line: current source line
     */
    public func waitForElementToExist(element: XCUIElement, timeout: NSTimeInterval = 10, file: StaticString = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(timeout) {
            (error) -> Void in
            if error != nil {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file.stringValue, atLine: line, expected: true)
            }
        }

    }

    /**
     Wait for an UI hittable element to appear in a view hierarchy. After given interval seconds, if element is not found, test fails.

     - parameter element: XCUIElement to wait for.
     - parameter timeout: waiting time (default: 10 seconds)
     - parameter file: current source file
     - parameter line: current source line
     */
    public func waitForVisibleElement(element: XCUIElement, timeout: NSTimeInterval = 10, file: StaticString = #file, line: UInt = #line) {
        let existsPredicate = NSPredicate(format: "exists == true && hittable == true")
        expectationForPredicate(existsPredicate, evaluatedWithObject: element, handler: nil)
        waitForExpectationsWithTimeout(timeout) {
            (error) -> Void in
            if error != nil {
                let message = "Failed to find hittable \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file.stringValue, atLine: line, expected: true)
            }
        }
    }
}
