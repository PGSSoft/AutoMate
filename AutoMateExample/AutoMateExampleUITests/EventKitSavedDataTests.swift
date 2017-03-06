//
//  EventKitSavedDataTests.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class EventKitSavedDataTests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        TestLauncher.configureWithDefaultOptions(app).launch()
    }

    func testIfRemindersAndEventsAreVisible() {
        let events: EventLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "events", bundleName: "test.AutoMateExampleUITests") ]
        let reminders: ReminderLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "reminders", bundleName: "test.AutoMateExampleUITests") ]
        TestLauncher.configureWithDefaultOptions(app, additionalOptions: [events, reminders]).launch()

        let mainPage = MainPage(in: app)
        let autoMateLaunchEnvironmentsPage = AutoMateLaunchEnvironmentsPage(in: app)

        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToEventKitView()
        XCTFail()
    }

}
