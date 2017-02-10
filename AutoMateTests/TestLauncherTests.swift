//
//  TestLauncherTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
@testable import AutoMate

class TestLauncherTests: XCTestCase {

    // MARK: Properties
    let argument = LaunchOptionsFactory.multiLanguageLaunchArgument
    let environment = LaunchOptionsFactory.futureEventsLaunchEnvironment

    // MARK: Tests
    func testConfigureCleanApplicationWithLaunchOptions() {
        let application = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: [argument, environment])

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, argument.launchArguments!)
        XCTAssertEqual(configApplication.launchEnvironment, environment.launchEnvironments!)
    }

    func testConfigureCleanApplicationWithDoubledLaunchOptions() {
        let application = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: [argument, argument, environment, environment])

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, argument.launchArguments!)
        XCTAssertEqual(configApplication.launchEnvironment, environment.launchEnvironments!)
    }

    func testConfigureSetUpApplicationWithoutLaunchOptions() {
        let application = ApplicationsFactory.configuredApplication
        let launcher = TestLauncher()

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, application.launchArguments)
        XCTAssertEqual(configApplication.launchEnvironment, application.launchEnvironment)
    }

    func testConfigureSetUpApplicationWithLaunchOptions() {
        let application = ApplicationsFactory.configuredApplication
        let launcher = TestLauncher(options: [argument, environment])

        let configApplication = launcher.configure(application)
        var argumentsSetUp = application.launchArguments
        argumentsSetUp += argument.launchArguments!
        var environmentSetUp = application.launchEnvironment
        environmentSetUp.unionInPlace(environment.launchEnvironments!)

        XCTAssertEqual(configApplication.launchArguments, argumentsSetUp)
        XCTAssertEqual(configApplication.launchEnvironment, environmentSetUp)
    }

    func testConfigureLauncherHelperMethod() {
        let application = ApplicationsFactory.cleanApplication
        let configApplication = TestLauncher.configure(application, withOptions: [argument, environment])

        XCTAssertEqual(configApplication.launchArguments, argument.launchArguments!)
        XCTAssertEqual(configApplication.launchEnvironment, environment.launchEnvironments!)
    }
}
