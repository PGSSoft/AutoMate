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
    lazy var events: EventLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "events", bundleName: "TestResourceBundle"))
    lazy var reminders: ReminderLaunchEnvironment = ReminderLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "reminders", bundleName: "TestResourceBundle"))

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testIfRemindersAndEventsAreVisible() {

        let mainPage = MainPage(in: app)
        let autoMateLaunchEnvironmentsPage = AutoMateLaunchEnvironmentsPage(in: app)
        let token = addUIInterruptionMonitor(withDescription: "`calendar") { (alert) -> Bool in
            guard let alertView = CalendarAlert(element: alert) else {
                XCTFail("Cannot create CalendarAlert object")
                return false
            }

            XCTAssertTrue(alertView.allowElement.exists)

            alertView.allowElement.tap()
            return true
        }

        TestLauncher.configureWithDefaultOptions(app, additionalOptions: [events, reminders]).launch()
        // Interruption won't happen without some kind of action.
        app.tap()
        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToEventsView()
        removeUIInterruptionMonitor(token)
        XCTFail()
    }

}
