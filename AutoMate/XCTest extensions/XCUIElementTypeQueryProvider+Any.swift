//
//  XCUIElementTypeQueryProvider+Any.swift
//  AutoMate
//
//  Created by Pawel Szot on 03/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

public protocol DescendantsMatching {
    func descendantsMatchingType(type: XCUIElementType) -> XCUIElementQuery
}

extension XCUIElement: DescendantsMatching { }
extension XCUIElementQuery: DescendantsMatching { }

extension XCUIElementTypeQueryProvider where Self: DescendantsMatching {

    /**
     Returns any element matching the query.
     */
    public var any: XCUIElementQuery {
        return descendantsMatchingType(.Any)
    }
}
