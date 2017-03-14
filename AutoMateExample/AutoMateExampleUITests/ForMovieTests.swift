//
//  ForMovieTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 14.03.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class ForMovieTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var appearingPage: AppearingPage = AppearingPage(in: self.app)
    lazy var textInputPage: TextInputPage = TextInputPage(in: self.app)
    lazy var middleButtonPage: MiddleButtonPage = MiddleButtonPage(in: self.app)
    lazy var tablePage: TablePage = TablePage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configure(app).launch()
    }

    // MARK: Tests
    func testForMovie() {
        waitForElementToExist()
        clearAndType()
        cellMatching()
    }

    // MARK: Helpers
    func waitForElementToExist() {
        mainPage.goToAppearingMenu()

        wait(forVisibilityOf: appearingPage.button)
        appearingPage.tapOnButton()
        wait(forExistanceOf: appearingPage.madeWithLoveView)
        appearingPage.goBack()
    }

    func clearAndType() {
        mainPage.goToTextInputMenu()

        textInputPage.textField.tap()
        textInputPage.textField.typeText("Made with love")
        textInputPage.textField.clear(andType: "by PGS")
        textInputPage.goBack()
    }

    func cellMatching() {
        mainPage.goToTablePageMenu()

        let firstCellOfAKind = tablePage.cells.element(containingLabels: [CellMatchingLocators.title: "Kind A", CellMatchingLocators.subtitle: "1st cell"])
        let secondCellOfBKind = tablePage.cells.element(containingLabels: [CellMatchingLocators.title: "*B", CellMatchingLocators.rightDetail: "2*"], labelsComparisonOperator: .like)
        let creditCell = tablePage.cells.element(containingLabels: [CellMatchingLocators.credit: "with love"], labelsComparisonOperator: .contains)

        firstCellOfAKind.tap()
        secondCellOfBKind.tap()
        creditCell.tap()

        tablePage.goBack()
    }
}

// MARK: - Locators
private extension ForMovieTests {
    enum CellMatchingLocators: String, Locator {
        case title
        case subtitle
        case rightDetail
        case credit
    }
}
