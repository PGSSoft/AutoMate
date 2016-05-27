//
//  Options.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

// MARK: - Option protocol
public protocol Option: Hashable, Equatable {
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

    public var hashValue: Int {
        return "\(self.dynamicType)".hashValue
    }
}

public func == <T where T: Option>(lhs: T, rhs: T) -> Bool {
    return lhs.hashValue == rhs.hashValue
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
