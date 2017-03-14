//
//  AutoMateLaunchEnvironmentsPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - AutoMateLaunchEnvironmentsPage
open class AutoMateLaunchEnvironmentsPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var eventsCell: XCUIElement {
        return item(for: .events)
    }

    open var remindersCell: XCUIElement {
        return item(for: .reminders)
    }

    open var contactsCell: XCUIElement {
        return item(for: .contacts)
    }

    // MARK: Helpers
    open func item(for locator: Locators) -> XCUIElement {
        return view.cells.element(containingLabels: [Locators.autoMateLaunchEnvironment: locator.identifier])
    }

    // MARK: Actions
    open func goToEventsView() {
        eventsCell.tap()
    }

    open func goToRemindersView() {
        remindersCell.tap()
    }

    open func goToContactsView() {
        contactsCell.tap()
    }
}

// MARK: - Locators
public extension AutoMateLaunchEnvironmentsPage {

    enum Locators: String, Locator {
        case autoMateLaunchEnvironment

        case events = "Events"
        case reminders = "Reminders"
        case contacts = "Contacts"
    }
}
