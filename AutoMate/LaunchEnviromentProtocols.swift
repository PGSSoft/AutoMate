//
//  LaunchEnviromentProtocols.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Enviroment Protocol
/// Protocol defining minimal requirements of launch enviroment option to be handled by framework.
/// Usage example:
///
/// ```swift
/// public struct SimpleLaunchEnviroment: LaunchEnviromentProtocol {
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
public protocol LaunchEnviromentProtocol: LaunchOption {

    // MARK: Associated types
    associatedtype Value: LaunchEnviromentValue
}

// MARK: - LaunchEnviromentWithSingleValue
/// Protocol defining minimal requirements for launch enviroment option with single values.
/// Provides default implementation for handling singe launch environment by providing `key` and `value`.
/// Usage example:
///
/// ```swift
/// public struct SimpleLaunchEnviroment: LaunchEnviromentWithSingleValue {
/// 
///     public typealias Value = String
///     public let key = "LAUNCH_KEY"
///     public var value: String
/// }
/// ```
public protocol LaunchEnviromentWithSingleValue: LaunchEnviromentProtocol {

    /// String representation of the environment key.
    var key: String { get }

    /// Value of the launch argument.
    var value: Value { get }
}

// MARK: Default implementation
public extension LaunchEnviromentWithSingleValue {

    /// Unique value to use when comparing with other launch options.
    public var uniqueIdentifier: String {
        return key
    }

    public var launchEnvironments: [String : String]? {
        return [key: value.value]
    }
}

// MARK: - Launch Enviroment With Multiple Values
/// Protocol defining minimal requirements for launch enviroment option with multiple values.
/// Provides default implementation for ```ExpressibleByArrayLiteral``` protocol.
/// Usage example:
///
/// ```swift
/// public struct ArrayLaunchEnviroment: LaunchEnviromentWithMultipleValues {
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
public protocol LaunchEnviromentWithMultipleValues: LaunchEnviromentProtocol, ExpressibleByArrayLiteral {

    // MARK: Properties
    var valuesCollection: [Value] { get }

    // MARK: Initialization
    init(valuesCollection: [Value])
}

// MARK: Default implementation
extension LaunchEnviromentWithMultipleValues {

    // MARK: Properties
    public var launchEnvironments: [String: String]? {
        return [uniqueIdentifier: valuesCollection.launchEnviroment]
    }

    // MARK: Initialization
    public init(arrayLiteral elements: Value...) {
        self.init(valuesCollection: elements)
    }
}
