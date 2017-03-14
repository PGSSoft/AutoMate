//
//  EventsListPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 13/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - EventsListPage
open class EventsListPage: BaseAppPage, PushedPage {

    // MARK: Elements
    public var tableView: XCUIElement {
        return view.tables[Locators.dataTableView]
    }

    // MARK: Helpers
    open func cell(for item: Event) -> EventCell {
        return EventCell(in: tableView, for: item)
    }
}

// MARK: - IdentifiableByElement
extension EventsListPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension EventsListPage {

    enum Locators: String, Locator {
        case dataTableView
    }
}

// MARK: - EventCell
open class EventCell: BaseAppPage {

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
    public init(in view: XCUIElement, for item: Event) {
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
            Locators.startDate: item.startDate,
            Locators.endDate: item.endDate
            ])
        super.init(in: view)
    }

    // MARK: Actions
    open func tap() {
        cell.tap()
    }
}

// MARK: - Locators
private extension EventCell {

    enum Locators: String, Locator {
        case title
        case location
        case calendar
        case startDate
        case endDate
    }
}
