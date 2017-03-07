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
    lazy var events: EventLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "events", bundleName: "com.pgs-soft.TestResourceBundle"))
    lazy var reminders: ReminderLaunchEnvironment = ReminderLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "reminders", bundleName: "com.pgs-soft.TestResourceBundle"))

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
        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToEventKitView()
        removeUIInterruptionMonitor(token)
        XCTFail()
    }

}
