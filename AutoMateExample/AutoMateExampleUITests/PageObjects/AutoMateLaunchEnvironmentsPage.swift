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

    open var eventKitCell: XCUIElement {
        return item(for: .eventKit)
    }

    open var contactsCell: XCUIElement {
        return item(for: .contacts)
    }

    open func item(for locator: Locators) -> XCUIElement {
        return view.cells.element(containingLabels: [Locators.autoMateLaunchEnvironment: locator.identifier])
    }

    open func goToEventKitView() {
        eventKitCell.tap()
    }

    open func goToContactsView() {
        contactsCell.tap()
    }

    open func cell(for item: CalendarItem) -> EventKitCell {
        return EventKitCell(in: view.tables.element, for: item)
    }
}

public extension AutoMateLaunchEnvironmentsPage {

    enum Locators: String, Locator {
        case autoMateLaunchEnvironment

        case eventKit = "EventKit"
        case contacts = "Contacts"
    }
}

open class EventKitCell {

    private let container: XCUIElement
    private let cell: XCUIElement

    open var isVisible: Bool {
        return cell.isVisible
    }

    public init(in view: XCUIElement, for item: CalendarItem) {
        container = view
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.location: item.location,
            Locators.calendar: item.calendar,
            Locators.notes: item.notes
                           ])
    }

    open func tap() {
        cell.tap()
    }
}

private extension EventKitCell {

    enum Locators: String, Locator {
        case title
        case location
        case calendar
        case notes
    }
}
