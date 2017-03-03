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

/// Default implementation of `launchEnvironments` property for types adapting also CleanableLaunchEnvironment.
public extension LaunchEnvironmentWithSingleValue where Self: CleanableLaunchEnvironment {

    /// `launchEnvironments` value depends on `shouldCleanBefore`, 
    /// if `true` - `CleanFlag` (defined in `CleanableLaunchEnvironment`) is added at the beginning of LaunchEnvironment value.
    /// Example:
    /// ```swift
    /// CleanableSimpleLaunchEnvironment(value: "PGS_WITH_LOVE", shouldCleanBefore: true).launchEnvironments
    /// ```
    /// Output: 
    /// ```swift
    /// ["LAUNCH_KEY": "AM_CLEAN_DATA_FLAG,PGS_WITH_LOVE"]
    public var launchEnvironments: [String: String]? {
        return shouldCleanBefore ? [key: "\(type(of: self).CleanFlag)," + value.value] : [key: value.value]
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

/// Default implementation of `launchEnvironments` property for types adapting also CleanableLaunchEnvironment.
public extension LaunchEnvironmentWithMultipleValues where Self: CleanableLaunchEnvironment {

    /// `launchEnvironments` value depends on `shouldCleanBefore`,
    /// if `true` - `CleanFlag` (defined in `CleanableLaunchEnvironment`) is added at the beginning of LaunchEnvironment value.
    /// Example:
    /// ```swift
    /// CleanableArrayLaunchEnvironment(shouldCleanBefore: true, valuesCollection: ["MADE_BY", "PGS_WITH_LOVE"]).launchEnvironments
    /// ```
    /// Output:
    /// ```swift
    /// ["CleanableArrayLaunchEnvironment": "AM_CLEAN_DATA_FLAG,PGS_WITH_LOVE,PGS_WITH_LOVE"]
    public var launchEnvironments: [String: String]? {
        return shouldCleanBefore ? [uniqueIdentifier: "\(type(of: self).CleanFlag)," + valuesCollection.launchEnvironment] : [uniqueIdentifier: valuesCollection.launchEnvironment]
    }
}

// MARK: - Cleanable Launch Environment
/// Protocol to be adapted by all LaunchEnviroment options that gives ability to clean present data before saving new.
/// To work as expected it requires handing special flag appended at the beginning of LaunchEnviroment value.
/// It is implemented by predefined in `AutoMate` options
/// and assures that default handling is provided by [AutoMate - AppBuddy](https://github.com/PGSSoft/AutoMate-AppBuddy)
/// Usage example:
///
/// ```swift
/// public struct CleanableSimpleLaunchEnvironment: CleanableLaunchEnvironment, LaunchEnvironmentWithSingleValue {
///
///     public typealias Value = String
///     public let key = "LAUNCH_KEY"
///     public var value: String
///     var shouldCleanBefore: Bool
/// }
/// ```
public protocol CleanableLaunchEnvironment: LaunchEnvironmentProtocol {

    // MARK: Properties
    var shouldCleanBefore: Bool { get }
}

public extension CleanableLaunchEnvironment {

    public static var CleanFlag: String {
        return "AM_CLEAN_DATA_FLAG"
    }
}

// MARK: - Cleanable Launch Environment With Multiple Values
/// `CleanableLaunchEnvironment` specialized for LaunchEnviroment options with multiple values. 
/// All predefined in `AutoMate` options implementing `LaunchEnvironmentWithMultipleValues`, 
/// that specific enables clean data before saving new one, implements this protocol. 
/// It provides few initializers extending `LaunchEnvironmentWithMultipleValues` initializers.
/// Usage example:
///
/// ```swift
/// public struct CleanableArrayLaunchEnvironment: CleanableLaunchEnvironmentWithMultipleValues {
///
///     public typealias Value = String
///     public let valuesCollection: [String]
///     public let shouldCleanBefore: Bool
///
///     public init(shouldCleanBefore: Bool, valuesCollection: [Value]) {
///         self.valuesCollection = valuesCollection
///         self.shouldCleanBefore = shouldCleanBefore
///     }
/// }
/// ```
/// - note:
/// `internal` initializer would be generated automatically but it would not fulfill requirement of `public` protocol.
public protocol CleanableLaunchEnvironmentWithMultipleValues: CleanableLaunchEnvironment, LaunchEnvironmentWithMultipleValues {

    // MARK: Initialization
    /// Initializer for LaunchEnviroment options enabling clean data before saving new one.
    ///
    /// - Parameters:
    ///   - shouldCleanBefore: Bool indicating if flag to handle clean data should be passed with option value.
    ///   - valuesCollection: [Value] array of LaunchEnvironment values.
    init(shouldCleanBefore: Bool, valuesCollection: [Value])
}

/// Default implementations of initializers inherited from `LaunchEnvironmentWithMultipleValues`.
public extension CleanableLaunchEnvironmentWithMultipleValues {

    // MARK: Initialization
    /// Calls `init(shouldCleanBefore: Bool, valuesCollection: [Value])` with before clean turned off.
    public init(valuesCollection: [Value]) {
        self.init(shouldCleanBefore: false, valuesCollection: valuesCollection)
    }

    /// Calls `init(shouldCleanBefore: Bool, valuesCollection: [Value])` with before clean turned off.
    public init(arrayLiteral elements: Value...) {
        self.init(shouldCleanBefore: false, valuesCollection: elements)
    }
}

/// Default implementations of initializers inherited from `LaunchEnvironmentWithMultipleValues` where `Value` is `LaunchEnvironmentResourceValue`.
public extension CleanableLaunchEnvironmentWithMultipleValues where Self.Value == LaunchEnvironmentResourceValue {

    // MARK: Initialization
    /// Calls `init(shouldCleanBefore: Bool, valuesCollection: [Value])` with before clean turned off.
    public init(shouldCleanBefore: Bool, resources: (fileName: String, bundleName: String?)...) {
        self.init(shouldCleanBefore: shouldCleanBefore, valuesCollection: resources.map(Value.init))
    }
}
