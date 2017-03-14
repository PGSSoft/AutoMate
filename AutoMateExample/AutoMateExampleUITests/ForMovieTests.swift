//
//  ForMovieTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 14.03.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class ForMovieTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var appearingPage: AppearingPage = AppearingPage(in: self.app)
    lazy var textInputPage: TextInputPage = TextInputPage(in: self.app)
    lazy var middleButtonPage: MiddleButtonPage = MiddleButtonPage(in: self.app)
    lazy var tablePage: TablePage = TablePage(in: self.app)
    lazy var permissionsPage: PermissionsPage = PermissionsPage(in: self.app)
    lazy var contactsPage: ContactsPage = ContactsPage(in: self.app)
    lazy var healthKitPage: HealthKitPage = HealthKitPage(in: self.app)
    lazy var healthPermissionPage: HealthPermissionPage = HealthPermissionPage(in: self.app)
    lazy var autoMateLaunchEnvironmentsPage: AutoMateLaunchEnvironmentsPage = AutoMateLaunchEnvironmentsPage(in: self.app)
    lazy var eventsListPage: EventsListPage = EventsListPage(in: self.app)

    // MARK: Data
    let events: EventLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "events", bundleName: "TestResourceBundle"))
    let event = Event(title: "Minimal Event Title", calendar: "Home", location: "", startDate: "2017-06-22 13:45:00", endDate: "2017-06-22 14:30:00")

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configure(app, withOptions: [
            events,
            SystemLanguages([.English]),
            SystemLocale(language: .English, country: .GreatBritain),
            SoftwareKeyboards([.EnglishUnitedKingdom])
        ]).launch()
    }

    // MARK: Tests
    func testForMovie() {
        let token = addUIInterruptionMonitor(withDescription: "Access request.") { (alert) -> Bool in
            guard let alertView = CalendarAlert(element: alert) else {
                XCTFail("Cannot create CalendarAlert object.")
                return false
            }

            alertView.allowElement.tap()
            return true
        }
        // Interruption won't happen without some kind of action.
        app.tap()

        removeUIInterruptionMonitor(token)

        waitForElementToExist()
        clearAndType()
        cellMatching()
        permissions()
        launchEnvironments()
    }

    // MARK: Helpers
    func waitForElementToExist() {
        mainPage.goToAppearingMenu()

        wait(forVisibilityOf: appearingPage.button)
        appearingPage.tapOnButton()
        wait(forExistanceOf: appearingPage.madeWithLoveView)
        appearingPage.goBack()
    }

    func clearAndType() {
        mainPage.goToTextInputMenu()

        textInputPage.textField.tap()
        textInputPage.textField.typeText("Made with love")
        textInputPage.textField.clear(andType: "by PGS")
        textInputPage.goBack()
    }

    func cellMatching() {
        mainPage.goToTablePageMenu()

        let firstCellOfAKind = tablePage.cells.element(containingLabels: [CellMatchingLocators.title: "Kind A", CellMatchingLocators.subtitle: "1st cell"])
        let secondCellOfBKind = tablePage.cells.element(containingLabels: [CellMatchingLocators.title: "*B", CellMatchingLocators.rightDetail: "2*"], labelsComparisonOperator: .like)
        let creditCell = tablePage.cells.element(containingLabels: [CellMatchingLocators.credit: "with love"], labelsComparisonOperator: .contains)

        firstCellOfAKind.tap()
        secondCellOfBKind.tap()
        creditCell.tap()

        tablePage.goBack()
    }

    func permissions() {
        mainPage.goToPermissionsPageMenu()
        contactsSystemAlert()
        healthKitAlert()
        permissionsPage.goBack()
    }

    func contactsSystemAlert() {
        let token = addUIInterruptionMonitor(withDescription: "Contacts") { (alert) -> Bool in
            guard let contactsAlert = AddressBookAlert(element: alert) else {
                XCTFail("Cannot create AddressBookAlert object")
                return false
            }

            contactsAlert.allowElement.tap()
            return true
        }

        permissionsPage.goToContacts()
        // Interruption won't happen without some kind of action.
        app.tap()
        contactsPage.goBack()
        removeUIInterruptionMonitor(token)
    }

    func healthKitAlert() {
        let token = addUIInterruptionMonitor(withDescription: "HomeKit") { (alert) -> Bool in
            guard let homeKitAlert = HealthAuthorizationDontAllowAlert(element: alert) else {
                XCTFail("Cannot create HealthAuthorizationDontAllowAlert object")
                return false
            }

            homeKitAlert.okElement.tap()
            return true
        }

        permissionsPage.goToHealthKit()

        wait(forVisibilityOf: healthPermissionPage)
        healthPermissionPage.turnOnAllElement.tap()
        healthPermissionPage.denyElement.tap()
        app.tap()

        healthKitPage.goBack()
        removeUIInterruptionMonitor(token)
    }

    func launchEnvironments() {
        mainPage.goToAutoMateLaunchEnvironments()

        eventsList()

        autoMateLaunchEnvironmentsPage.goBack()
    }

    func eventsList() {
        autoMateLaunchEnvironmentsPage.goToEventsView()

        let eventCell = eventsListPage.cell(for: event)
        eventsListPage.tableView.swipe(to: eventCell.cell)
        eventCell.tap()

        eventsListPage.goBack()
    }
}

// MARK: - Locators
private extension ForMovieTests {
    enum CellMatchingLocators: String, Locator {
        case title
        case subtitle
        case rightDetail
        case credit
    }
}
