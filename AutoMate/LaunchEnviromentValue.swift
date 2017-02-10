//
//  LaunchEnviromentValue.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Enviroment Value protocol
/// Contains basic requirements for type that will be used as value for launch enviroment.
/// Usage example:
///
/// ```swift
/// public enum DataSource: String, LaunchEnviromentValue {
///     case valid = "mock_valid"
///     case error = "mock_error"
/// }
public protocol LaunchEnviromentValue {

    // MARK: Properties
    var value: String { get }
}

/// Default implementation for `RawRepresentable<String>`
extension LaunchEnviromentValue where Self: RawRepresentable, Self.RawValue == String {

    // MARK: Properties
    public var value: String {
        return rawValue
    }
}

// MARK: - Launch enviroment values
/// Represents launch environment value of type Bool.
///
/// - `true`: `true` value
/// - `false`: `false` value
public enum BooleanLaunchEnviromentValue: String, ExpressibleByBooleanLiteral, LaunchEnviromentValue {

    /// Value of true, or 1.
    case `true`
    /// Value of false, or 0.
    case `false`

    // MARK: BooleanLiteralConvertible
    /// Initializes boolean launch environment with boolean literal type.
    ///
    /// - Parameter value: Literal to use during initialization.
    public init(booleanLiteral value: BooleanLiteralType) {
        self = value ? .true : .false
    }
}
