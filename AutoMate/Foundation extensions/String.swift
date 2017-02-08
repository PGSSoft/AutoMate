//
//  String.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

/// Default implementation LaunchEnviromentValue for string.
/// Usage example:
///
/// ```swift
/// public struct StringLaunchEnviroment: LaunchEnviromentProtocol {
///
///     public typealias Value = String
///     public let value: Value
///     public var launchEnvironments: [String : String]? {
///         return [uniqueIdentifier: value]
///     }
///     public init(value: Value) {
///         self.value = value
///     }
/// }
/// ```
/// - note:
/// `internal` initializer would be generated automatically but it would not fulfill requirement of `public` protocol.
extension String: LaunchEnviromentValue {

    // MARK: Properties
    public var value: String {
        return self
    }
}
