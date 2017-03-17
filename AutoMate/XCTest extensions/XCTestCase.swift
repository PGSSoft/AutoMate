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

    // MARK: Properties
    /// Default timeout used in `wait` methods.
    /// By default set to 10 seconds.
    class var defaultTimeOut: TimeInterval { return 10 }

    public func wait(forFulfillmentOf predicate: NSPredicate,
                     for element: XCUIElement,
                     withFailingMessage message: String = "Failed to fulfill predicate %@ for %@ after %f seconds.",
                     timeout: TimeInterval = XCTestCase.defaultTimeOut,
                     file: StaticString = #file,
                     line: UInt = #line) {

        expectation(for: predicate, evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) -> Void in
            guard error != nil else {
                return
            }
            let failingMessage = String(format: message, predicate, element, timeout)
            self.recordFailure(withDescription: failingMessage, inFile: String(describing: file), atLine: line, expected: true)
        }
    }

    // MARK: Methods
    /// Wait for an UI element to exist in a view hierarchy. After given interval, if element is not found, test fails.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let button = view.buttons["appearingButton"]
    /// wait(forExistanceOf: button)
    /// ```
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait(forExistanceOf element: XCUIElement, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        let existancePredicate = NSPredicate(format: "exists == true")
        wait(forFulfillmentOf: existancePredicate, for: element, withFailingMessage: "Failed to find %2$@ after %3$f seconds. Predicate was %1$@.", timeout: timeout, file: file, line: line)
    }

    /// Wait for an UI element to be visible in a view hierarchy. After given interval seconds, if element is not found, test fails.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let button = view.buttons["appearingButton"]
    /// wait(forVisibilityOf: button)
    /// ```
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait(forVisibilityOf element: XCUIElement, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        let visibilityPredicate = NSPredicate(format: "exists == true && hittable == true")
        wait(forFulfillmentOf: visibilityPredicate, for: element, withFailingMessage: "Failed to find visible %2$@ after %3$f seconds. Predicate was %1$@.", timeout: timeout, file: file, line: line)
    }

    /// Wait for an UI element to be not visible in a view hierarchy. After given interval seconds, if the element is still visible, test fails.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let button = view.buttons["appearingButton"]
    /// wait(forInvisibilityOf: button)
    /// ```
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait(forInvisibilityOf element: XCUIElement, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        let invisibilityPredicate = NSPredicate(format: "hittable == false")
        wait(forFulfillmentOf: invisibilityPredicate, for: element, withFailingMessage: "Failed to find invisible %2$@ after %3$f seconds. Predicate was %1$@.", timeout: timeout, file: file, line: line)
    }
}
