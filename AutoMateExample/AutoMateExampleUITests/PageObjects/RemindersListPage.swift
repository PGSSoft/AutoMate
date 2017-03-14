//
//  RemindersListPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 13/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - RemindersListPage
open class RemindersListPage: BaseAppPage, PushedPage {

    // MARK: Elements
    public var tableView: XCUIElement {
        return view.tables[Locators.dataTableView]
    }

    // MARK: Helpers
    open func cell(for item: Reminder) -> ReminderCell {
        return ReminderCell(in: tableView, for: item)
    }
}

// MARK: - IdentifiableByElement
extension RemindersListPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension RemindersListPage {

    enum Locators: String, Locator {
        case dataTableView
    }
}

// MARK: - ReminderCell
open class ReminderCell: BaseAppPage {

    // MARK: Elements
    let cell: XCUIElement

    // MARK: Properties
    open var isVisible: Bool {
        return cell.isVisible
    }

    open var exists: Bool {
        return cell.exists
    }

    // MARK: Initialization
    public init(in view: XCUIElement, for item: Reminder) {
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.calendar: item.calendar
        ])
        super.init(in: view)
    }

    // MARK: Actions
    open func tap() {
        cell.tap()
    }
}

// MARK: - Locators
private extension ReminderCell {

    enum Locators: String, Locator {
        case title
        case calendar
        case completionDate
        case startDate
        case notes
    }
}
