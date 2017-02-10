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
