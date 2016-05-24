//
//  Options.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

// MARK: - Option protocol
public protocol Option {
    var launchArguments: [String]? { get }
    var launchEnvironments: [String: String]? { get }
}

extension Option {
    public var launchArguments: [String]? {
        return nil
    }

    public var launchEnvironments: [String: String]? {
        return nil
    }
}

// MARK: - LaunchArgumentValue protocol
public protocol LaunchArgumentValue {
    var launchArgument: String { get }
}

public extension LaunchArgumentValue where Self: RawRepresentable, Self.RawValue == String {
    var launchArgument: String {
        return "\"\(rawValue)\""
    }
}

// MARK: - ArgumetOption protocol
public protocol ArgumetOption: Option, CustomStringConvertible {
    associatedtype Value: LaunchArgumentValue
    var argumentKey: String { get }
}

// MARK: - SingleArgumentOption protocol
public protocol SingleArgumentOption: ArgumetOption {
    var value: Value { get }
    init(_ value: Value)
}

extension SingleArgumentOption {
    // MARK: CustomStringConvertible
    public var description: String {
        return "<\(self.dynamicType): languages:\(self.value)>"
    }

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", value.launchArgument]
    }
}

// MARK: - CollectionArgumetOption protocol
public protocol CollectionArgumetOption: ArgumetOption, ArrayLiteralConvertible {
    var values: [Value] { get }
    init(_ values: [Value])

    // MARK: ArrayLiteralConvertible
    associatedtype Element = Value
}

extension CollectionArgumetOption {
    // MARK: CustomStringConvertible
    public var description: String {
        return "<\(self.dynamicType): languages:\(self.values)>"
    }

    // MARK: Option
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", values.launchArgument]
    }
}
