//
//  SystemLaunchEnviromentsTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class SystemLaunchEnviromentsTests: XCTestCase {

    // MARK: Tests
    func testKeyValueLaunchEnviroment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.pgsWithLoveLaunchEnviroment]), ["MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.pgsWithLoveLaunchEnviroment, LaunchOptionsFactory.frameworkLaunchEnviroment]),
                       ["MADE_WITH_LOVE_BY": "PGS", "FRAMEWORK": "Automate"])
    }

    func testMultipleKeyValueLaunchEnviroment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnviroments]),
                       ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnviroments, LaunchOptionsFactory.accomplishedLaunchEnviroments]),
                       ["SAVED_TIME": "of_developers_for_coffee", "MADE_SMILE": "qa_specialists", "SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"])
    }

    func testEventLaunchEnviroment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnviroment]), ["AM_EVENTS_KEY": "nil:this_week"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.futureEventsLaunchEnviroment, LaunchOptionsFactory.thisWeekEventsLaunchEnviroment]),
                       ["AM_EVENTS_KEY": "Resources:next_week, nil:recurring_monthly"])
    }

    func testAnimationLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.turnOffAnimationLaunchEnvironment]), ["AM_ANIMATION_KEY": "false"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.turnOnAnimationLaunchEnvironment]), ["AM_ANIMATION_KEY": "true"])
    }

    func testCombinedLaunchEnviroment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnviroment, LaunchOptionsFactory.pgsWithLoveLaunchEnviroment]),
                       ["AM_EVENTS_KEY": "nil:this_week", "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnviroments, LaunchOptionsFactory.pgsWithLoveLaunchEnviroment]),
                       ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall", "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnviroment, LaunchOptionsFactory.goalsLaunchEnviroments, LaunchOptionsFactory.pgsWithLoveLaunchEnviroment]),
                       ["AM_EVENTS_KEY": "nil:this_week", "SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall", "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnviroment, LaunchOptionsFactory.goalsLaunchEnviroments, LaunchOptionsFactory.pgsWithLoveLaunchEnviroment, LaunchOptionsFactory.turnOffAnimationLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "nil:this_week", "SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall", "MADE_WITH_LOVE_BY": "PGS", "AM_ANIMATION_KEY": "false"])
    }

    // MARK: Helpers
    func build(with input: [LaunchOption]) -> [String: String] {
        var app = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: input)
        app = launcher.configure(app)

        XCTAssertEqual(app.launchArguments, [])
        return app.launchEnvironment
    }
}
