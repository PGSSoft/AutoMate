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

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainView)
    }

    // MARK: Tests
    func testLocationSystemAlertButton() {
        let token = addUIInterruptionMonitor(withDescription: "Location") { (alert) -> Bool in
            guard let locationAlert = self.matchAlert(to: alert, withType: LocationWhenInUseAlert.self) else {
                XCTFail("Cannot create LocationWhenInUseAlert object")
                return false
            }

            XCTAssertTrue(locationAlert.denyElement.exists)
            XCTAssertTrue(locationAlert.allowElement.exists)

            locationAlert.denyElement.tap()
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToLocation()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
    }

    func testContactsSystemAlertButton() {
        let token = addUIInterruptionMonitor(withDescription: "Contacts") { (alert) -> Bool in
            guard let contactsAlert = self.matchAlert(to: alert, withType: AddressBookAlert.self) else {
                XCTFail("Cannot create AddressBookAlert object")
                return false
            }

            XCTAssertTrue(contactsAlert.denyElement.exists)
            XCTAssertTrue(contactsAlert.allowElement.exists)

            contactsAlert.denyElement.tap()
            return true
        }

        mainView.goToPermissionsViewMenu()
        permissionsView.goToContacts()
        // Interruption won't happen without some kind of action.
        app.tap()
        contactsView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
    }

    // MARK: Helpers
    func matchedAlerts(for element: XCUIElement, in alerts: [SystemAlert.Type] = AlertsFactory.allAlerts) -> [SystemAlert] {
        return alerts.flatMap { $0.init(element: element) }
    }

    func matchAlert<T: SystemAlert>(to element: XCUIElement, withType: T.Type) -> T? {
        let alerts = self.matchedAlerts(for: element)
        XCTAssertEqual(alerts.count, 1, "Ony one alert should match, currently matched \(alerts.count)")
        guard let matchedAlert = alerts.first as? T else {
            XCTFail("Cannot create \(T.self) object")
            return nil
        }
        return matchedAlert
    }
}
