//
//  RemindersListPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 13/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

open class RemindersListPage: BaseAppPage, PushedPage {

    public var tableView: XCUIElement {
        return view.tables.element
    }

    open func cell(for item: Reminder) -> ReminderCell {
        return ReminderCell(in: tableView, for: item)
    }
}

open class ReminderCell {

    private let container: XCUIElement
    let cell: XCUIElement

    open var isVisible: Bool {
        return cell.isVisible
    }

    open var exists: Bool {
        return cell.exists
    }

    public init(in view: XCUIElement, for item: Reminder) {
        container = view
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.calendar: item.calendar
            ])
    }

    open func tap() {
        cell.tap()
    }
}

private extension ReminderCell {

    enum Locators: String, Locator {
        case title
        case calendar
        case completionDate
        case startDate
        case notes
    }
}
