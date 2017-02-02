//
//  LaunchEnviroments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 20/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Enviroments
/// Most basic and generic structure to pass (key: value) pairs through `TestLauncher`.
/// Usage example:
///
/// ```swift
/// let launchEnviromentDictionary: LaunchEnviroments = ["CORPORATION_KEY": "PGS", "PROJECT_KEY": "AutoMate"]
public struct LaunchEnviroments: LaunchEnviromentProtocol, ExpressibleByDictionaryLiteral {

    // MARK: Typealiases
    public typealias Key = String
    public typealias Value = String

    // MARK: Properties
    public let data: [String: String]

    public var uniqueIdentifier: String {
        return "\(data.reduce(0) { $0 ^ $1.0.hashValue })"
    }

    public var launchEnvironments: [String: String]? {
        return data
    }

    // MARK: Initialization
    public init(dictionaryLiteral elements: (Key, Value)...) {
        data = Dictionary(elements: elements)
    }
}

// MARK: - Launch Enviroment
/// Simple implementation of `LaunchEnviroment` that wraps single (key: value) pair for `TestLauncher`.
/// Usage example:
///
/// ```swift
/// let launchEnviromentOption = LaunchEnviroment(key: "MADE_WITH_LOVE_BY", value: "PGS")
public struct LaunchEnviroment: LaunchEnviromentProtocol {

    // MARK: Typealiases
    public typealias Value = String

    // MARK: Properties
    public let key: String
    public let value: String

    public var launchEnvironments: [String: String]? {
        return [key: value]
    }

    public var uniqueIdentifier: String {
        return key
    }

    // MARK: - Initialization
    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}
