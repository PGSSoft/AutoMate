//
//  TestLauncher.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//
import XCTest

public protocol Application {
    var launchArguments: [String] { get set }
    var launchEnvironment: [String: String] { get set }
}

extension XCUIApplication: Application { }

public struct TestLauncher {

    // MARK: Properties
    var options: LaunchOptionsSet

    // MARK: Initializers
    public init(options: [LaunchOption]) {
        self.options = LaunchOptionsSet(options)
    }

    // MARK: Public methods
    public func configure<T: Application>(application: T) -> T {
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
        return options.flatMap { $0.launchArguments }.reduce([], combine: +)
    }

    /**
     Builds launch environments.

     - returns: Dictionary of launch environments
     */
    var launchEnvironments: [String: String] {
        return options.flatMap { $0.launchEnvironments }.reduce([:]) { $0.union($1) }
    }
}
