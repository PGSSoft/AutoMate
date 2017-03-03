//
//  TestLauncher.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 19/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//
import XCTest

// MARK: - Application
/// Types implementing this protocol can be configured with launch options and variables by the `TestLauncher`.
public protocol Application {

    // MARK: Properties
    /// Array where generated arguments will be appended.
    var launchArguments: [String] { get set }

    /// Dictionary where launch environment variables will be appended.
    var launchEnvironment: [String: String] { get set }
}

// MARK: - XCUIApplication Application extension
extension XCUIApplication: Application { }

// MARK: - TestLauncher
/// Configures given application with provided launch options and variables.
/// `TestLauncher` is a wrapper around `XCUIApplication.launchArguments` and `XCUIApplication.launchEnvironment`.
/// By using abstract type, `LaunchOption`, it is possible to pass parameters to the testing application.
///
/// `AutoMate` provides set of options which can set system locale, language, keyboard languages,
/// or advanced options like CoreData SQL debug verbosity level.
///
/// **Example:**
///
/// ```swift
/// let app = XCUIApplication()
/// TestLauncher(options: [
///     SystemLanguages([.English, .German]),
///     SystemLocale(language: .English, country: .Canada),
///     SoftwareKeyboards([.EnglishCanada, .GermanGermany])
/// ]).configure(app).launch()
/// ```
public struct TestLauncher {

    // MARK: Properties
    /// Options that will be passed to the application.
    var options: LaunchOptionsSet

    // MARK: Initializers
    /**
     Initializes `TestLauncher` with given options.

     - parameter options: Options to initialize with.
     */
    public init(options: [LaunchOption] = []) {
        self.options = LaunchOptionsSet(options)
    }

    // MARK: Public methods
    /**
     Passes stored settings to the provided application.

     - parameter application: Object implementing `Application` protocol that will receive the settings, eg. `XCUIApplication`.
     - returns: Application with passed settings.
     */
    public func configure<T: Application>(_ application: T) -> T {
        var application = application
        application.launchArguments += launchArguments
        application.launchEnvironment.unionInPlace(launchEnvironments)
        return application
    }

    // MARK: Public static methods
    /// Initializes `TestLauncher` with given options and configure application object with launch arguments and launch environments.
    ///
    /// - Parameters:
    ///   - application: Object implementing Application protocol that will receive the settings, eg. `XCUIApplication`.
    ///   - options: Options to initialize `TestLauncher` and application.
    /// - Returns: Application with passed settings.
    public static func configure<T: Application>(_ application: T, withOptions options: [LaunchOption] = []) -> T {
        return TestLauncher(options: options).configure(application)
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
