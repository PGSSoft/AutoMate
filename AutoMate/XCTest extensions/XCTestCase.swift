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

    // MARK: Methods
    /// Wait for an UI element to exist in a view hierarchy. After given interval, if element is not found, test fails.
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line:
    public func wait(forExistanceOf element: XCUIElement, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        let existancePredicate = NSPredicate(format: "exists == true")
        expectation(for: existancePredicate, evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) -> Void in
            guard error != nil else {
                return
            }
            let message = "Failed to find \(element) after \(timeout) seconds."
            self.recordFailure(withDescription: message, inFile: String(describing: file), atLine: line, expected: true)
        }
    }

    /// Wait for an UI element to be visible in a view hierarchy. After given interval seconds, if element is not found, test fails.
    ///
    /// - Parameters:
    ///   - element: XCUIElement to wait for.
    ///   - timeout: Waiting time (default: 10 seconds).
    ///   - file: Current source file.
    ///   - line: Current source line.
    public func wait(forVisibilityOf element: XCUIElement, timeout: TimeInterval = XCTestCase.defaultTimeOut, file: StaticString = #file, line: UInt = #line) {
        let visabilityPredicate = NSPredicate(format: "exists == true && hittable == true")
        expectation(for: visabilityPredicate, evaluatedWith: element, handler: nil)

        waitForExpectations(timeout: timeout) { (error) -> Void in
            guard error != nil else {
                return
            }
            let message = "Failed to find visible \(element) after \(timeout) seconds."
            self.recordFailure(withDescription: message, inFile: String(describing: file), atLine: line, expected: true)
        }
    }
}
