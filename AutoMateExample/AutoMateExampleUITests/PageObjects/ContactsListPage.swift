//
//  ContactsListPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 14.03.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - ContactsListPage
open class ContactsListPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var tableView: XCUIElement {
        return view.tables[Locators.dataTableView]
    }

    // MARK: Helpers
    open func cell(for item: Contact) -> ContactCell {
        return ContactCell(in: tableView, for: item)
    }
}

// MARK: - IdentifiableByElement
extension ContactsListPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension ContactsListPage {

    enum Locators: String, Locator {
        case dataTableView
    }
}

// MARK: - ContactCell
open class ContactCell: BaseAppPage {

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
    public init(in view: XCUIElement, for item: Contact) {
        cell = view.cells.element(containingLabels: [
            Locators.name: item.name
        ])
        super.init(in: view)
    }

    // MARK: Actions
    open func tap() {
        cell.tap()
    }
}

// MARK: - Locators
private extension ContactCell {
    enum Locators: String, Locator {
        case name
        case nickname
        case social
        case profile
        case phone
        case phoneNumber
        case url
        case urlAddress
        case email
        case emailAddress
    }
}
