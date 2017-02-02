//
//  LaunchArgumentProtocols.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 17/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - LaunchArgument protocol
/**
 Any type that implements this protocol can be used to configure application
 with TestLauncher. Specifically it represents launch argument option so it requires to provide argument key.
 Type conforming to this protocol should override default implementation of *launchArguments*.
 For more info about launch arguments variables check:
 [here](https://developer.apple.com/library/ios/recipes/xcode_help-scheme_editor/Articles/SchemeRun.html)
 */
public protocol LaunchArgument: LaunchOption {

    /// String representation of the argument.
    var key: String { get }
}

public extension LaunchArgument {

    /// Unique value to use when comparing with other launch options.
    public var uniqueIdentifier: String {
        return key
    }
}

// MARK: - LaunchArgumentWithSingleValue protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts single
 argument value.
 */
public protocol LaunchArgumentWithSingleValue: LaunchArgument {
    /// Value of the launch argument.
    var value: LaunchArgumentValue { get }
}

extension LaunchArgumentWithSingleValue {

    // MARK: Option
    /// Default formatted representation of the launch argument.
    public var launchArguments: [String]? {
        return ["-\(key)", value.value]
    }
}

extension LaunchArgumentWithSingleValue where Self: LaunchArgumentValue {
    /// Default formatted representation of the launch argument value.
    public var value: LaunchArgumentValue {
        return self
    }
}

// MARK: - LaunchArgumentWithMultipleValues protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts collection
 of values.
 */
public protocol LaunchArgumentWithMultipleValues: LaunchArgument, ExpressibleByArrayLiteral {
    associatedtype Value: LaunchArgumentValue

    /// Array of values associated to the launch argument.
    var values: [Value] { get }

    /// Initializes object with given array of valeus.
    init(_ values: [Value])

    // MARK: ArrayLiteralConvertible
    associatedtype Element = Value
}

extension LaunchArgumentWithMultipleValues {

    // MARK: Option
    /// Default formatted representation of the launch argument.
    public var launchArguments: [String]? {
        return ["-\(key)", values.launchArgument]
    }

    /**
     Initializes launch argument with a list.
     - parameter elements: list of values.
     */
    public init(arrayLiteral elements: Value ...) {
        self.init(elements)
    }
}
