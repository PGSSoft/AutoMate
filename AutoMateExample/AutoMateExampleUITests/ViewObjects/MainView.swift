//
//  MainView.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - MainView
open class MainView: BaseAppView {

    // MARK: Elements
    open var tableView: XCUIElement {
        return view.tables[Locators.tableView]
    }

    open var textInputMenu: XCUIElement {
        return menu(withTitle: Locators.textInputMenu)
    }

    open var appearingMenu: XCUIElement {
        return menu(withTitle: Locators.appearingViewMenu)
    }

    open var scrollViewMenu: XCUIElement {
        return menu(withTitle: Locators.scrollViewMenu)
    }

    open var permissionsViewMenu: XCUIElement {
        return menu(withTitle: Locators.permissionsViewMenu)
    }

    open var middleButtonMenu: XCUIElement {
        return menu(withTitle: Locators.middleButtonMenu)
    }

    open var tableViewMenu: XCUIElement {
        return menu(withTitle: Locators.tableViewMenu)
    }

    open var autoMateLaunchEnvironments: XCUIElement {
        return menu(withTitle: Locators.autoMateLaunchEnvironments)
    }

    // MARK: Actions
    open func goToTextInputMenu() {
        textInputMenu.tap()
    }

    open func goToAppearingMenu() {
        appearingMenu.tap()
    }

    open func goToScrollViewMenu() {
        scrollViewMenu.tap()
    }

    open func goToPermissionsViewMenu() {
        permissionsViewMenu.tap()
    }

    open func goToMiddleButtonMenu() {
        middleButtonMenu.tap()
    }

    open func goToTableViewMenu() {
        tableViewMenu.tap()
    }

    open func goToAutoMateLaunchEnvironments() {
        autoMateLaunchEnvironments.tap()
    }

    // MARK: Helpers
    private func menu(withTitle locator: Locator) -> XCUIElement {
        return tableView.cells.element(containingLabels: [Locators.menuItemName: locator.identifier])
    }
}

// MARK: - IdentifiableByElement
extension MainView: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension MainView {

    enum Locators: String, Locator {
        case tableView
        case menuItemName

        case textInputMenu = "Text input"
        case appearingViewMenu = "Appearing view"
        case scrollViewMenu = "Scroll view"
        case permissionsViewMenu = "Permissions"
        case middleButtonMenu = "Middle button"
        case tableViewMenu = "Table view"
        case autoMateLaunchEnvironments = "AutoMate Launch Environments"
    }
}
