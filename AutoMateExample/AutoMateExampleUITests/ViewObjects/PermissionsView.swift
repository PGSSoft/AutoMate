//
//  PermissionsView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - PermissionsView
open class PermissionsView: BaseAppView, PushedView {

    // MARK: Elements
    open var tableView: XCUIElement {
        return view.tables[Locators.tableView]
    }

    open var locationAlways: XCUIElement {
        return tableView.cells[Locators.locationAlways]
    }

    open var locationWhenInUse: XCUIElement {
        return tableView.cells[Locators.locationWhenInUse]
    }

    open var contacts: XCUIElement {
        return tableView.cells[Locators.contacts]
    }

    open var homeKit: XCUIElement {
        return tableView.cells[Locators.homeKit]
    }

    open var healthKit: XCUIElement {
        return tableView.cells[Locators.healthKit]
    }

    // MARK: Actions
    open func goToLocationAlways() {
        locationAlways.tap()
    }

    open func goToLocationWhenInUse() {
        locationWhenInUse.tap()
    }

    open func goToContacts() {
        contacts.tap()
    }

    open func goToHomeKit() {
        homeKit.tap()
    }

    open func goToHealthKit() {
        healthKit.tap()
    }
}

// MARK: - Locators
private extension PermissionsView {

    enum Locators: String, Locator {
        case tableView
        case menuItemName

        case locationAlways
        case locationWhenInUse
        case contacts
        case homeKit
        case healthKit
    }
}
