//
//  TestLauncher.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//
import XCTest

/// Types implementing this protocol can be configured with launch options and variables by the `TestLauncher`.
public protocol Application {

    /// Array where generated arguments will be appended.
    var launchArguments: [String] { get set }

    /// Dictionary where launch enviroment variables will be appended.
    var launchEnvironment: [String: String] { get set }
}

extension XCUIApplication: Application { }

/// Configures given application with provided launch options and variables.
public struct TestLauncher {

    // MARK: Properties
    /// Options that will be passed to the application.
    var options: LaunchOptionsSet

    // MARK: Initializers
    /**
     Initializes `TestLauncher` with given options.

     - parameter options: Options to initialize with.
     */
    public init(options: [LaunchOption]) {
        self.options = LaunchOptionsSet(options)
    }

    // MARK: Public methods
    /**
     Passes stored settings to the provided application.

     - parameter application: Object implementing Application protocol that will receive the settings.
     - returns: Application with passed settings.
     */
    public func configure<T: Application>(_ application: T) -> T {
        var application = application
        application.launchArguments += launchArguments
        application.launchEnvironment.unionInPlace(launchEnvironments)
        return application
    }

    // MARK: Build methods
    /**
     Builds launch arguments.

     - returns: List of launch arguments.
     */
    var launchArguments: [String] {
        return options.flatMap({ $0.launchArguments }).reduce([], +)
    }

    /**
     Builds launch environments.

     - returns: Dictionary of launch environments
     */
    var launchEnvironments: [String: String] {
        return options.flatMap({ $0.launchEnvironments }).reduce([:]) { $0.union($1) }
    }
}
