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
    var uniqueIdentifier: Int { get }
}

public extension LaunchOption {

    public var launchArguments: [String]? {
        return nil
    }

    public var launchEnvironments: [String: String]? {
        return nil
    }

    public var uniqueIdentifier: Int {
        return "\(self.dynamicType)".hashValue
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
public protocol ArgumentOption: LaunchOption, CustomStringConvertible {
    var argumentKey: String { get }
}

public extension ArgumentOption {
    public var uniqueIdentifier: Int {
        return argumentKey.hashValue
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
// MARK: - SingleArgumentOption protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts single
 argument value.
 */
public protocol SingleArgumentOption: ArgumentOption {
    var value: LaunchArgumentValue { get }
}

extension SingleArgumentOption {
    // MARK: CustomStringConvertible
    public var description: String {
        return "<\(self.dynamicType): \(self.value)>"
    }

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", value.launchArgument]
    }
}

extension SingleArgumentOption where Self: LaunchArgumentValue {
    public var value: LaunchArgumentValue {
        return self
    }
}

// MARK: - CollectionArgumetOption protocol
/**
 Protocol that should be implemented by types representing launch argument that accepts collection
 of values.
 */
public protocol CollectionArgumetOption: ArgumentOption, ArrayLiteralConvertible {
    var values: [LaunchArgumentValue] { get }
    init(_ values: [LaunchArgumentValue])

    // MARK: ArrayLiteralConvertible
    associatedtype Element = LaunchArgumentValue
}

extension CollectionArgumetOption {
    // MARK: CustomStringConvertible
    public var description: String {
        return "<\(self.dynamicType): \(self.values)>"
    }

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", "(" + values.map({ $0.launchArgument }).joinWithSeparator(", ") + ")"]
    }

    public init(arrayLiteral elements: LaunchArgumentValue ...) {
        self.init(elements)
    }
}
