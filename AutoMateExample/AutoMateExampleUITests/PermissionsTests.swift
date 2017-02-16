//
//  PermissionsTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class PermissionsTests: AppUITestCase {

    // MARK: Arrange View Objects
    lazy var mainView: MainView = MainView(in: self.app)
    lazy var permissionsView: PermissionsView = PermissionsView(in: self.app)
    lazy var locationView: LocationView = LocationView(in: self.app)
    lazy var contactsView: ContactsView = ContactsView(in: self.app)
    lazy var homeKitView: HomeKitView = HomeKitView(in: self.app)
    lazy var healthKitView: HealthKitView = HealthKitView(in: self.app)
    lazy var healthPermissionView: HealthPermissionView = HealthPermissionView(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainView)
    }

    // MARK: Tests
    func locationWhenInUse() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Location") { (alert) -> Bool in
            guard let locationAlert = LocationWhenInUseAlert(element: alert) else {
                XCTFail("Cannot create LocationWhenInUseAlert object")
                return false
            }

            XCTAssertTrue(locationAlert.denyElement.exists)
            XCTAssertTrue(locationAlert.allowElement.exists)

            locationAlert.allowElement.tap()
            handled = true
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToLocationWhenInUse()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func locationUpgradeToAlways() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Location") { (alert) -> Bool in
            guard let locationAlert = LocationUpgradeWhenInUseAlwaysAlert(element: alert) else {
                XCTFail("Cannot create LocationUpgradeWhenInUseAlwaysAlert object")
                return false
            }

            XCTAssertTrue(locationAlert.cancelElement.exists)
            XCTAssertTrue(locationAlert.allowElement.exists)

            locationAlert.cancelElement.tap()
            handled = true
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToLocationAlways()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testLocationSystemAlert() {
        locationWhenInUse()
        locationUpgradeToAlways()
    }

    func testContactsSystemAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Contacts") { (alert) -> Bool in
            guard let contactsAlert = AddressBookAlert(element: alert) else {
                XCTFail("Cannot create AddressBookAlert object")
                return false
            }

            XCTAssertTrue(contactsAlert.denyElement.exists)
            XCTAssertTrue(contactsAlert.allowElement.exists)

            contactsAlert.denyElement.tap()
            handled = true
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToContacts()
        // Interruption won't happen without some kind of action.
        app.tap()
        contactsView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testHomeKitAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "HomeKit") { (alert) -> Bool in
            guard let homeKitAlert = WillowAlert(element: alert) else {
                XCTFail("Cannot create WillowAlert object")
                return false
            }

            XCTAssertTrue(homeKitAlert.denyElement.exists)
            XCTAssertTrue(homeKitAlert.allowElement.exists)

            homeKitAlert.denyElement.tap()
            handled = true
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToHomeKit()
        // Interruption won't happen without some kind of action.
        app.tap()
        homeKitView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testHealthKitAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "HomeKit") { (alert) -> Bool in
            guard let homeKitAlert = HealthAuthorizationDontAllowAlert(element: alert) else {
                XCTFail("Cannot create HealthAuthorizationDontAllowAlert object")
                return false
            }

            XCTAssertTrue(homeKitAlert.okElement.exists)

            homeKitAlert.okElement.tap()
            handled = true
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToHealthKit()

        wait(forVisibilityOf: healthPermissionView)
        XCTAssertTrue(healthPermissionView.allowElement.exists)
        XCTAssertTrue(healthPermissionView.denyElement.exists)
        XCTAssertTrue(healthPermissionView.turnOnAllElement.exists)

        healthPermissionView.turnOnAllElement.tap()

        XCTAssertTrue(healthPermissionView.turnOffAllElement.exists)

        healthPermissionView.denyElement.tap()
        app.tap()

        healthKitView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }
}
