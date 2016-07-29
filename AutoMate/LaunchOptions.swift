//
//  Options.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

// MARK: - LaunchOption protocol
/**
 Any type that implements this protocol can be used to configure application
 with TestLauncher. Type conforming to this protocol should override default implementation
 of *launchArguments* or *launchEnvironments*. Choice depends on which type of configuration
 option it represents.
 For more info about launch arguments and enviroment variables check:
 [here](https://developer.apple.com/library/ios/recipes/xcode_help-scheme_editor/Articles/SchemeRun.html)
 */
public protocol LaunchOption {
    var launchArguments: [String]? { get }
    var launchEnvironments: [String: String]? { get }
    var uniqueIdentifier: String { get }
}

public extension LaunchOption {

    public var launchArguments: [String]? {
        return nil
    }

    public var launchEnvironments: [String: String]? {
        return nil
    }

    public var uniqueIdentifier: String {
        return "\(self.dynamicType)"
    }
}

// MARK: - ArgumentOption protocol
/**
 Any type that implements this protocol can be used to configure application
 with TestLauncher. Specificly it represents launch argument option so it requires to provide argument key.
 Type conforming to this protocol should override default implementation of *launchArguments*.
 For more info about launch arguments variables check:
 [here](https://developer.apple.com/library/ios/recipes/xcode_help-scheme_editor/Articles/SchemeRun.html)
 */
public protocol LaunchArgument: LaunchOption {
    var argumentKey: String { get }
}

public extension LaunchArgument {
    public var uniqueIdentifier: String {
        return argumentKey
    }
}

// MARK: - LaunchArgumentValue protocol
/**
 Represents single portion of data to be passed through launch argument.
 */
public protocol LaunchArgumentValue {
    var launchArgument: String { get }
}

public extension LaunchArgumentValue where Self: RawRepresentable, Self.RawValue == String {
    var launchArgument: String {
        return "\"\(rawValue)\""
    }
}

// MARK: - LaunchArgumentWithSingleValue protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts single
 argument value.
 */
public protocol LaunchArgumentWithSingleValue: LaunchArgument {
    var value: LaunchArgumentValue { get }
}

extension LaunchArgumentWithSingleValue {

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", value.launchArgument]
    }
}

extension LaunchArgumentWithSingleValue where Self: LaunchArgumentValue {
    public var value: LaunchArgumentValue {
        return self
    }
}

// MARK: - LaunchArgumentWithMultipleValues protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts collection
 of values.
 */
public protocol LaunchArgumentWithMultipleValues: LaunchArgument, ArrayLiteralConvertible {
    associatedtype Value: LaunchArgumentValue
    var values: [Value] { get }
    init(_ values: [Value])

    // MARK: ArrayLiteralConvertible
    associatedtype Element = Value
}

extension LaunchArgumentWithMultipleValues {

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", values.launchArgument]
    }

    public init(arrayLiteral elements: Value ...) {
        self.init(elements)
    }
}
