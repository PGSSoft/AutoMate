//
//  Screens.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 18/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest

protocol TableElement {
    var title: String { get }
    init(app: XCUIApplication)
}

extension TableElement {
    static func open(inside app: XCUIApplication) -> Self {
        let element = Self(app: app)

        let cell = app.staticTexts[element.title]
        cell.tap()

        // workaround for problem with tap directly after launch
        if cell.exists {
            cell.tap()
            assert(!cell.exists)
        }

        return element
    }
}

struct ScrollViewScreen: TableElement {
    let title = "Scroll view"
    let buttonTop: XCUIElement
    let buttonMiddle1: XCUIElement
    let buttonMiddle2: XCUIElement
    let buttonBottom: XCUIElement
    let textField: XCUIElement
    let scrollView: XCUIElement

    init(app: XCUIApplication) {
        buttonTop = app.buttons["ButtonTop"]
        buttonMiddle1 = app.buttons["ButtonMiddle1"]
        buttonMiddle2 = app.buttons["ButtonMiddle2"]
        buttonBottom = app.buttons["ButtonBottom"]
        textField = app.textFields.element
        scrollView = app.scrollViews.element
    }
}

struct TextInputScreen: TableElement {
    let title = "Text input"
    let textField: XCUIElement

    init(app: XCUIApplication) {
        textField = app.textFields.element
    }
}

struct LocationScreen: TableElement {
    let title = "Location"
    let deniedLabel: XCUIElement

    init(app: XCUIApplication) {
        deniedLabel = app.staticTexts["Denied"]
    }
}

struct MiddleButtonScreen: TableElement {
    let title = "Middle button"
    let label: XCUIElement
    let button: XCUIElement

    init(app: XCUIApplication) {
        label = app.staticTexts["Pressed"]
        button = app.buttons.element
    }
}

struct AppearingScreen: TableElement {
    let title = "Appearing view"
    let buttonAppearing: XCUIElement
    let buttonNotExisting: XCUIElement

    init(app: XCUIApplication) {
        buttonAppearing = app.buttons["Button"]
        buttonNotExisting = app.buttons["Button1"]
    }
}

struct TableScreen: TableElement {
    let title = "Table view"
    init(app: XCUIApplication) {
    }
}
