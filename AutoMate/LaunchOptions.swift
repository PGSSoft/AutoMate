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
    /// Launch arguments provided by this option.
    var launchArguments: [String]? { get }

    /// Launch enviroment variables provided by this option.
    var launchEnvironments: [String: String]? { get }

    /// Unique value to use when comparing with other launch options.
    var uniqueIdentifier: String { get }
}

public extension LaunchOption {

    /// Launch arguments provided by this option.
    public var launchArguments: [String]? {
        return nil
    }

    /// Launch enviroment variables provided by this option.
    public var launchEnvironments: [String: String]? {
        return nil
    }

    /// Unique value to use when comparing with other launch options.
    public var uniqueIdentifier: String {
        return "\(type(of: self))"
    }
}

// MARK: - ArgumentOption protocol
/**
 Any type that implements this protocol can be used to configure application
 with TestLauncher. Specifically it represents launch argument option so it requires to provide argument key.
 Type conforming to this protocol should override default implementation of *launchArguments*.
 For more info about launch arguments variables check:
 [here](https://developer.apple.com/library/ios/recipes/xcode_help-scheme_editor/Articles/SchemeRun.html)
 */
public protocol LaunchArgument: LaunchOption {

    /// String representation of the argument.
    var argumentKey: String { get }
}

public extension LaunchArgument {

    /// Unique value to use when comparing with other launch options.
    public var uniqueIdentifier: String {
        return argumentKey
    }
}

// MARK: - LaunchArgumentValue protocol
/// Represents single portion of data to be passed through launch argument.
public protocol LaunchArgumentValue {

    /// String representation of the value.
    var launchArgument: String { get }
}

public extension LaunchArgumentValue where Self: RawRepresentable {
    /// Default string representation for raw representable launch arguments.
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
    /// Value of the launch argument.
    var value: LaunchArgumentValue { get }
}

extension LaunchArgumentWithSingleValue {

    // MARK: Option
    /// Default formatted representation of the launch argument.
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", value.launchArgument]
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
        return ["-\(argumentKey)", values.launchArgument]
    }

    /**
     Initializes launch argument with a list.
     - parameter elements: list of values.
     */
    public init(arrayLiteral elements: Value ...) {
        self.init(elements)
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
