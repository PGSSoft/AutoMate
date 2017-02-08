//
//  LaunchArgumentValue.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 17/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - LaunchArgumentValue protocol
/// Represents single portion of data to be passed through launch argument.
public protocol LaunchArgumentValue {

    /// String representation of the value.
    var value: String { get }
}

public extension LaunchArgumentValue where Self: RawRepresentable {
    /// Default string representation for raw representable launch arguments.
    var value: String {
        return "\"\(rawValue)\""
    }
}

// MARK: - Launch argument values

///Represents launch argument value of type Bool.
public enum BooleanLaunchArgumentValue: Int, ExpressibleByBooleanLiteral, LaunchArgumentValue {
    /// Value of true, or 1.
    case `true` = 1
    /// Value of false, or 0.
    case `false` = 0

    // MARK: BooleanLiteralConvertible
    /**
     Initializes boolean launch argument with boolean literal type.
     - parameter value: Literal to use during initialization.
     */
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? .true : .false
    }
}
