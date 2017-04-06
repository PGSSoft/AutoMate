//
//  CollectionPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 06.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - CollectionPage
open class CollectionPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var collectionView: XCUIElement {
        return view.collectionViews[Locators.collectionView]
    }

    // MARK: Helpers
    open func cell(with name: String) -> XCUIElement {
        return collectionView.cells.element(containingLabels: [Locators.cellName: name])
    }
}

// MARK: - Locators
private extension CollectionPage {

    enum Locators: String, Locator {
        case collectionView
        case cellName
    }
}
