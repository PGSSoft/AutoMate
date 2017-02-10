//
//  TestLauncher.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 03.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import AutoMate

extension TestLauncher {

    /// Default set of options to run the application
    static let defaultLaunchOptions: [LaunchOption] = [AnimationLaunchEnvironment()]

    /// Configure `TestLauncher` with default set of options and additional options if provided
    ///
    /// - Parameters:
    ///   - application: Object implementing Application protocol that will receive the settings.
    ///   - options: Additional options to initialize `TestLauncher` and application.
    /// - Returns: Application with passed settings.
    public static func configureWithDefaultOptions<T: Application>(_ application: T, additionalOptions options: [LaunchOption] = []) -> T {
        return TestLauncher(options: defaultLaunchOptions + options).configure(application)
    }
}
