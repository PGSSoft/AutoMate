//
//  AutoMateLaunchEnvironmentsView.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

open class AutoMateLaunchEnvironmentsView: BaseAppView, PushedView {

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
}

public extension AutoMateLaunchEnvironmentsView {

    enum Locators: String, Locator {
        case autoMateLaunchEnvironment

        case eventKit = "EventKit"
        case contacts = "Contacts"
    }
}
