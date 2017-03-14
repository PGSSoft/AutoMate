//
//  ContactsSavedDataTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 10.03.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class ContactsSavedDataTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var autoMateLaunchEnvironmentsPage: AutoMateLaunchEnvironmentsPage = AutoMateLaunchEnvironmentsPage(in: self.app)
    lazy var contactsListPage: ContactsListPage = ContactsListPage(in: self.app)

    // MARK: Data
    lazy var contacts: ContactLaunchEnvironment = ContactLaunchEnvironment(shouldCleanBefore: false, resources: (fileName: "contacts", bundleName: "TestResourceBundle"))
    let contact = Contact(firstName: "Given Name", lastName: "Family Name")

    // MARK: Set up
    override func setUp() {
        super.setUp()
    }

    // MARK: Tests
    func testAddContacts() {

        let token = addUIInterruptionMonitor(withDescription: "calendar") { (alert) -> Bool in
            guard let alertView = AddressBookAlert(element: alert) else {
                XCTFail("Cannot create AddressBookAlert object")
                return false
            }

            XCTAssertTrue(alertView.allowElement.exists)

            alertView.allowElement.tap()
            return true
        }

        TestLauncher.configureWithDefaultOptions(app, additionalOptions: [contacts]).launch()
        // Interruption won't happen without some kind of action.
        app.tap()

        mainPage.goToAutoMateLaunchEnvironments()
        autoMateLaunchEnvironmentsPage.goToContactsView()

        removeUIInterruptionMonitor(token)

        let contactCell = contactsListPage.cell(for: contact)
        XCTAssertTrue(contactCell.exists)

        contactsListPage.tableView.swipe(to: contactCell.cell)
        XCTAssertTrue(contactCell.isVisible)

        contactCell.tap()
        contactsListPage.goBack()
        autoMateLaunchEnvironmentsPage.goBack()
    }
}
