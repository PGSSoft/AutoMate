//
//  EventKitSavedDataTests.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class EventKitSavedDataTests: AppUITestCase {

    // MARK: Page objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var autoMateLaunchEnvironmentsPage: AutoMateLaunchEnvironmentsPage = AutoMateLaunchEnvironmentsPage(in: self.app)
    lazy var eventsListPage: EventsListPage = EventsListPage(in: self.app)
    lazy var remindersListPage: RemindersListPage = RemindersListPage(in: self.app)

    // MARK: Data
    let events: EventLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "events", bundleName: "TestResourceBundle"))
    let reminders: ReminderLaunchEnvironment = ReminderLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "reminders", bundleName: "TestResourceBundle"))
    let event = Event(title: "Minimal Event Title", calendar: "Home", location: "", startDate: "2017-06-22 13:45:00", endDate: "2017-06-22 14:30:00")
    let reminder = Reminder(title: "Random Reminder Title", calendar: "Reminders", notes: "Everybody are welcome", startDate: "", completionDate: "2016-12-22 14:30:00")

    // MARK: Set up
    override func setUp() {
        super.setUp()
    }

    // MARK: Tests
    func testIfEventsAreVisible() {
        let token = allowAccess { CalendarAlert(element: $0) }
        TestLauncher.configureWithDefaultOptions(app, additionalOptions: [events]).launch()
        // Interruption won't happen without some kind of action.
        app.tap()
        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToEventsView()

        removeUIInterruptionMonitor(token)

        let eventCell = eventsListPage.cell(for: event)
        XCTAssertTrue(eventCell.exists)

        eventsListPage.tableView.swipe(to: eventCell.cell)
        XCTAssertTrue(eventCell.isVisible)

        eventCell.tap()
        eventsListPage.goBack()
        autoMateLaunchEnvironmentsPage.goBack()
    }

    func testIfRemindersAreVisible() {
        let token = allowAccess { RemindersAlert(element: $0) }
        TestLauncher.configureWithDefaultOptions(app, additionalOptions: [reminders]).launch()
        // Interruption won't happen without some kind of action.
        app.tap()
        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToRemindersView()
        removeUIInterruptionMonitor(token)

        let reminderCell = remindersListPage.cell(for: reminder)
        XCTAssertTrue(reminderCell.exists)

        eventsListPage.tableView.swipe(to: reminderCell.cell)
        XCTAssertTrue(reminderCell.isVisible)

        reminderCell.tap()
        eventsListPage.goBack()
        autoMateLaunchEnvironmentsPage.goBack()
    }

    // MARK: Helpers
    func allowAccess(for alertClosure: @escaping (XCUIElement) -> SystemAlertAllow?) -> NSObjectProtocol {

        return addUIInterruptionMonitor(withDescription: "Access request.") { (alert) -> Bool in
            guard let alertView = alertClosure(alert) else {
                XCTFail("Cannot create Allow System Alert object.")
                return false
            }

            XCTAssertTrue(alertView.allowElement.exists)

            alertView.allowElement.tap()
            return true
        }
    }
}
