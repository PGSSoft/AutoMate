//
//  MainPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - MainPage
open class MainPage: BaseAppPage {

    // MARK: Elements
    open var tableView: XCUIElement {
        return view.tables[Locators.tableView]
    }

    open var textInputMenu: XCUIElement {
        return menu(withTitle: .textInputMenu)
    }

    open var appearingMenu: XCUIElement {
        return menu(withTitle: .appearingViewMenu)
    }

    open var scrollViewMenu: XCUIElement {
        return menu(withTitle: .scrollViewMenu)
    }

    open var scrollVerticallyViewMenu: XCUIElement {
        return menu(withTitle: .scrollVerticallyViewMenu)
    }

    open var longTableViewMenu: XCUIElement {
        return menu(withTitle: .longTableViewMenu)
    }

    open var collectionViewMenu: XCUIElement {
        return menu(withTitle: .collectionViewMenu)
    }

    open var permissionsViewMenu: XCUIElement {
        return menu(withTitle: .permissionsViewMenu)
    }

    open var middleButtonMenu: XCUIElement {
        return menu(withTitle: .middleButtonMenu)
    }

    open var tableViewMenu: XCUIElement {
        return menu(withTitle: .tableViewMenu)
    }

    open var rotateViewMenu: XCUIElement {
        return menu(withTitle: .rotateViewMenu)
    }

    open var autoMateLaunchEnvironments: XCUIElement {
        return menu(withTitle: .autoMateLaunchEnvironments)
    }

    // MARK: Actions
    open func goToTextInputMenu() {
        textInputMenu.tap()
    }

    open func goToAppearingMenu() {
        appearingMenu.tap()
    }

    open func goToScrollMenu() {
        scrollViewMenu.tap()
    }

    open func goToScrollVerticallyMenu() {
        scrollVerticallyViewMenu.tap()
    }

    open func goToLongTableViewMenu() {
        longTableViewMenu.tap()
    }

    open func goToCollectionViewMenu() {
        collectionViewMenu.tap()
    }

    open func goToPermissionsPageMenu() {
        permissionsViewMenu.tap()
    }

    open func goToMiddleButtonMenu() {
        middleButtonMenu.tap()
    }

    open func goToTablePageMenu() {
        tableViewMenu.tap()
    }

    open func goToRotatePageMenu() {
        return rotateViewMenu.tap()
    }

    open func goToAutoMateLaunchEnvironments() {
        autoMateLaunchEnvironments.tap()
    }

    // MARK: Helpers
    private func menu(withTitle locator: Locators) -> XCUIElement {
        return tableView.cells.element(containingLabels: [Locators.menuItemName: locator.identifier])
    }
}

// MARK: - IdentifiableByElement
extension MainPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension MainPage {

    enum Locators: String, Locator {
        case tableView
        case menuItemName

        case textInputMenu = "Text input"
        case appearingViewMenu = "Appearing view"
        case scrollViewMenu = "Scroll view"
        case scrollVerticallyViewMenu = "Scroll vertically view"
        case longTableViewMenu = "Long table view"
        case collectionViewMenu = "Collection view"
        case permissionsViewMenu = "Permissions"
        case middleButtonMenu = "Middle button"
        case tableViewMenu = "Table view"
        case rotateViewMenu = "Rotate view"
        case autoMateLaunchEnvironments = "AutoMate Launch Environments"
    }
}
