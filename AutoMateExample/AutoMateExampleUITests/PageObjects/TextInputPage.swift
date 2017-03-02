//
//  TextInputPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - TextInputPage
open class TextInputPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var textField: XCUIElement {
        return view.textFields[Locators.textField]
    }

    // MARK: Helpers
    open func textFieldValue() -> String {
        return textField.text
    }
}

// MARK: - Locators
private extension TextInputPage {

    enum Locators: String, Locator {
        case textField
    }
}
