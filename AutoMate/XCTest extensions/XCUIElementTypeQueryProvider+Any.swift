//
//  XCUIElementTypeQueryProvider+Any.swift
//  AutoMate
//
//  Created by Pawel Szot on 03/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

/// Protocol for types that implement `descendantsMatchingType` method.
public protocol DescendantsMatching {

    /// Methods provided by the XCTest framework for some types.
    ///
    /// - Parameter type: Type of descendands to find.
    /// - Returns: Query searching elements of given type.
    func descendants(matching type: XCUIElementType) -> XCUIElementQuery
}

extension XCUIElement: DescendantsMatching { }
extension XCUIElementQuery: DescendantsMatching { }

extension XCUIElementTypeQueryProvider where Self: DescendantsMatching {

    // MARK: Properties
    /// Creates a query that matches all descendants of the element.
    ///
    /// **Example:**
    ///
    /// Check that the first cells has any subviews.
    ///
    /// ```swift
    /// XCTAssertTrue(app.cells.elementBoundByIndex(0).any.count > 0)
    /// ```
    public var any: XCUIElementQuery {
        return descendants(matching: .any)
    }
}
