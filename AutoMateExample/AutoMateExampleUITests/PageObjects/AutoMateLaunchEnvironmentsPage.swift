//
//  AutoMateLaunchEnvironmentsPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

open class AutoMateLaunchEnvironmentsPage: BaseAppPage, PushedPage {

    open var eventsCell: XCUIElement {
        return item(for: .events)
    }

    open var remindersCell: XCUIElement {
        return item(for: .reminders)
    }

    open var contactsCell: XCUIElement {
        return item(for: .contacts)
    }

    open func item(for locator: Locators) -> XCUIElement {
        return view.cells.element(containingLabels: [Locators.autoMateLaunchEnvironment: locator.identifier])
    }

    open func goToEventsView() {
        eventsCell.tap()
    }

    open func goToRemindersView() {
        remindersCell.tap()
    }

    open func goToContactsView() {
        contactsCell.tap()
    }

    open func cell(for item: Event) -> EventCell {
        return EventCell(in: view.tables.element, for: item)
    }

    open func cell(for item: Reminder) -> ReminderCell {
        return ReminderCell(in: view.tables.element, for: item)
    }
}

public extension AutoMateLaunchEnvironmentsPage {

    enum Locators: String, Locator {
        case autoMateLaunchEnvironment

        case events = "Events"
        case reminders = "Reminders"
        case contacts = "Contacts"
    }
}

open class EventCell {

    private let container: XCUIElement
    private let cell: XCUIElement

    open var isVisible: Bool {
        return cell.isVisible
    }

    public init(in view: XCUIElement, for item: Event) {
        container = view
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.location: item.location,
            Locators.calendar: item.calendar,
            Locators.startDate: item.startDate,
            Locators.endDate: item.endDate
                           ])
    }

    open func tap() {
        cell.tap()
    }
}

private extension EventCell {

    enum Locators: String, Locator {
        case title
        case location
        case calendar
        case startDate
        case endDate
    }
}

open class ReminderCell {

    private let container: XCUIElement
    private let cell: XCUIElement

    open var isVisible: Bool {
        return cell.isVisible
    }

    public init(in view: XCUIElement, for item: Reminder) {
        container = view
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.calendar: item.calendar,
            Locators.notes: item.notes,
            Locators.startDate: item.startDate,
            Locators.completionDate: item.completionDate
            ])
    }

    open func tap() {
        cell.tap()
    }
}

private extension ReminderCell {

    enum Locators: String, Locator {
        case title
        case startDate
        case completionDate
        case calendar
        case notes
    }
}
