//
//  TablePage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - TablePage
open class TablePage: BaseAppPage, PushedPage {

    // MARK: Elements
    public var cells: XCUIElementQuery {
        return view.cells
    }
}
