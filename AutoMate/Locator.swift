//
//  Locator.swift
//  AutoMate
//
//  Created by Ewelina Cyło on 18/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

/**
 Protocol for locators to enforce string representation.
 */
public protocol Locator {
    var identifier: String { get }
}

/**
 For any RawRepresentable thats rawValue is String type implementation is provided for free.
 */
public extension Locator where Self: RawRepresentable, Self.RawValue == String {
    public var identifier: String {
        return rawValue
    }
}
