//
//  EventsListPage.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 13/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

open class EventsListPage: BaseAppPage, PushedPage {

    public var tableView: XCUIElement {
        return view.tables.element
    }

    open func cell(for item: Event) -> EventCell {
        return EventCell(in: tableView, for: item)
    }
}

open class EventCell {

    private let container: XCUIElement
    let cell: XCUIElement

    open var isVisible: Bool {
        return cell.isVisible
    }

    open var exists: Bool {
        return cell.exists
    }

    public init(in view: XCUIElement, for item: Event) {
        container = view
        cell = view.cells.element(containingLabels: [
            Locators.title: item.title,
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
