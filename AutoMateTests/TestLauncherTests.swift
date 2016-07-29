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

    let argument = LaunchOptionsFactory.multiLanguageLaunchArgument
    let enviroment = LaunchOptionsFactory.testLaunchEnviromentOption

    // configure
    func testConfigureCleanApplicationWithOptionsLaunch() {
        let application = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: [argument, enviroment])

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, argument.launchArguments!)
        XCTAssertEqual(configApplication.launchEnvironment, enviroment.launchEnvironments!)
    }

    func testConfigureCleanApplicationWithDoubledOptionsLaunch() {
        let application = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: [argument, argument, enviroment, enviroment])

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, argument.launchArguments!)
        XCTAssertEqual(configApplication.launchEnvironment, enviroment.launchEnvironments!)
    }

    func testConfigureSetUpApplicationWithoutOptionsLaunch() {
        let application = ApplicationsFactory.configuredApplication
        let launcher = TestLauncher(options: [])

        let configApplication = launcher.configure(application)
        XCTAssertEqual(configApplication.launchArguments, application.launchArguments)
        XCTAssertEqual(configApplication.launchEnvironment, application.launchEnvironment)
    }

    func testConfigureSetUpApplicationWithOptionsLaunch() {
        let application = ApplicationsFactory.configuredApplication
        let launcher = TestLauncher(options: [argument, enviroment])

        let configApplication = launcher.configure(application)
        var argumentsSetUp = application.launchArguments
        argumentsSetUp += argument.launchArguments!
        var enviromentSetUp = application.launchEnvironment
        enviromentSetUp.unionInPlace(enviroment.launchEnvironments!)

        XCTAssertEqual(configApplication.launchArguments, argumentsSetUp)
        XCTAssertEqual(configApplication.launchEnvironment, enviromentSetUp)
    }
}
