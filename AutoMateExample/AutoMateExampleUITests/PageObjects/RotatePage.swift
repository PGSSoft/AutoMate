//
//  RotatePage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 11.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - RotatePage
open class RotatePage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var centerLabel: XCUIElement {
        return view.staticTexts[Locators.centerLabel]
    }

    open var buttonA: XCUIElement {
        return view.buttons[Locators.buttonA]
    }

    open var buttonB: XCUIElement {
        return view.buttons[Locators.buttonB]
    }

    open var buttonC: XCUIElement {
        return view.buttons[Locators.buttonC]
    }

    open var buttonD: XCUIElement {
        return view.buttons[Locators.buttonD]
    }

    open var showNavigation: XCUIElement {
        return view.buttons[Locators.showNavigation]
    }

    // MARK: Actions
    open func tapButtonA() {
        buttonA.tap()
    }

    open func tapButtonB() {
        buttonB.tap()
    }

    open func tapButtonC() {
        buttonC.tap()
    }

    open func tapButtonD() {
        buttonD.tap()
    }

    open func tapButtonA(with vector: CGVector) {
        buttonA.coordinate(withNormalizedOffset: vector).tap()
    }

    open func tapButtonB(with vector: CGVector) {
        buttonB.coordinate(withNormalizedOffset: vector).tap()
    }

    open func tapButtonC(with vector: CGVector) {
        buttonC.coordinate(withNormalizedOffset: vector).tap()
    }

    open func tapButtonD(with vector: CGVector) {
        buttonD.coordinate(withNormalizedOffset: vector).tap()
    }

    open func tapShowNavigation() {
        showNavigation.tap()
    }
}

// MARK: - IdentifiableByElement
extension RotatePage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return centerLabel
    }
}

// MARK: - Locators
private extension RotatePage {

    enum Locators: String, Locator {
        case buttonA
        case buttonB
        case buttonC
        case buttonD
        case centerLabel
        case showNavigation
    }
}
