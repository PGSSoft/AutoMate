//
//  LaunchEnvironmentValue.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Environment Value
/// Contains basic requirements for type that will be used as value for launch environment.
/// Usage example:
///
/// ```swift
/// public enum DataSource: String, LaunchEnvironmentValue {
///     case valid = "mock_valid"
///     case error = "mock_error"
/// }
public protocol LaunchEnvironmentValue {

    // MARK: Properties
    var value: String { get }
}

/// Default implementation for `RawRepresentable<String>`
extension LaunchEnvironmentValue where Self: RawRepresentable, Self.RawValue == String {

    // MARK: Properties
    public var value: String {
        return rawValue
    }
}
