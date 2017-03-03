//
//  LaunchEnvironmentProtocols.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Environment Protocol
/// Protocol defining minimal requirements of launch environment option to be handled by framework.
/// Usage example:
///
/// ```swift
/// public struct SimpleLaunchEnvironment: LaunchEnvironmentProtocol {
///
///     public typealias Value = String
///     public let value: String
///     public var launchEnvironments: [String : String]? {
///         return [uniqueIdentifier: value]
///     }
///     public init(value: String) {
///         self.value = value
///     }
/// }
/// ```
/// - note:
/// `internal` initializer would be generated automatically but it would not fulfill requirement of `public` protocol.
public protocol LaunchEnvironmentProtocol: LaunchOption {

    // MARK: Associated types
    associatedtype Value: LaunchEnvironmentValue
}

// MARK: - LaunchEnvironmentWithSingleValue
/// Protocol defining minimal requirements for launch environment option with single values.
/// Provides default implementation for handling singe launch environment by providing `key` and `value`.
/// Usage example:
///
/// ```swift
/// public struct SimpleLaunchEnvironment: LaunchEnvironmentWithSingleValue {
///
///     public typealias Value = String
///     public let key = "LAUNCH_KEY"
///     public var value: String
/// }
/// ```
public protocol LaunchEnvironmentWithSingleValue: LaunchEnvironmentProtocol {

    /// String representation of the environment key.
    var key: String { get }

    /// Value of the launch argument.
    var value: Value { get }
}

// MARK: Default implementation
public extension LaunchEnvironmentWithSingleValue {

    /// Unique value to use when comparing with other launch options.
    public var uniqueIdentifier: String {
        return key
    }

    public var launchEnvironments: [String: String]? {
        return [key: value.value]
    }
}

// MARK: - Launch Environment With Multiple Values
/// Protocol defining minimal requirements for launch environment option with multiple values.
/// Provides default implementation for ```ExpressibleByArrayLiteral``` protocol.
/// Usage example:
///
/// ```swift
/// public struct ArrayLaunchEnvironment: LaunchEnvironmentWithMultipleValues {
///
///     public typealias Value = String
///     public let valuesCollection: [String]
///
///     public init(valuesCollection: [Value]) {
///         self.valuesCollection = valuesCollection
///     }
/// }
/// ```
/// - note:
/// `internal` initializer would be generated automatically but it would not fulfill requirement of `public` protocol.
public protocol LaunchEnvironmentWithMultipleValues: LaunchEnvironmentProtocol, ExpressibleByArrayLiteral {

    // MARK: Properties
    var valuesCollection: [Value] { get }

    // MARK: Initialization
    init(valuesCollection: [Value])
}

// MARK: Default implementation
extension LaunchEnvironmentWithMultipleValues {

    // MARK: Properties
    public var launchEnvironments: [String: String]? {
        return [uniqueIdentifier: valuesCollection.launchEnvironment]
    }

    // MARK: Initialization
    public init(arrayLiteral elements: Value...) {
        self.init(valuesCollection: elements)
    }
}

public protocol CleanableLaunchEnvironment: LaunchEnvironmentProtocol {

    // MARK: Properties
    var shouldCleanBefore: Bool { get }
}

public extension CleanableLaunchEnvironment {

    public static var CleanFlag: String {
        return "AM_CLEAN_DATA_FLAG"
    }
}

public extension LaunchEnvironmentWithSingleValue where Self: CleanableLaunchEnvironment {

    public var launchEnvironments: [String: String]? {
        return shouldCleanBefore ? [key: "\(type(of: self).CleanFlag)," + value.value] : [key: value.value]
    }
}

public extension LaunchEnvironmentWithMultipleValues where Self: CleanableLaunchEnvironment {

    public var launchEnvironments: [String: String]? {
        return shouldCleanBefore ? [uniqueIdentifier: "\(type(of: self).CleanFlag)," + valuesCollection.launchEnvironment] : [uniqueIdentifier: valuesCollection.launchEnvironment]
    }
}
