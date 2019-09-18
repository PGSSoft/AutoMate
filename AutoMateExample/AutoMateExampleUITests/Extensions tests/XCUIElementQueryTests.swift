//
//  XCUIElementQueryTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 01.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class XCUIElementQueryTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var tablePage: TablePage = TablePage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainPage)
    }

    // MARK: Tests
    func testElementMatchingLabel() {
        mainPage.goToTablePageMenu()

        let creditCellLabelDefault = app.any.element(withLabelMatching: "Made with love by")
        let creditCellLabelEquals = app.any.element(withLabelMatching: "Made with love by", comparisonOperator: .equals)
        let creditCellLabelLike = app.any.element(withLabelMatching: "Made *", comparisonOperator: .like)
        let creditCellLabelMatches = app.any.element(withLabelMatching: "Made.*", comparisonOperator: .matches)
        let creditCellLabelBeginsWith = app.any.element(withLabelMatching: "Made", comparisonOperator: .beginsWith)
        let creditCellLabelEndsWith = app.any.element(withLabelMatching: "love by", comparisonOperator: .endsWith)
        let creditCellLabelContains = app.any.element(withLabelMatching: "with love", comparisonOperator: .contains)
        let creditCallLabel = app.any.element(withLocator: Locators.credit, labels: ["Z miłością przez", "Made with love by"])

        XCTAssertTrue(creditCellLabelDefault.isHittable)
        creditCellLabelDefault.tap()

        XCTAssertTrue(creditCellLabelEquals.isHittable)
        creditCellLabelEquals.tap()

        XCTAssertTrue(creditCellLabelLike.isHittable)
        creditCellLabelLike.tap()

        XCTAssertTrue(creditCellLabelMatches.isHittable)
        creditCellLabelMatches.tap()

        XCTAssertTrue(creditCellLabelBeginsWith.isHittable)
        creditCellLabelBeginsWith.tap()

        XCTAssertTrue(creditCellLabelEndsWith.isHittable)
        creditCellLabelEndsWith.tap()

        XCTAssertTrue(creditCellLabelContains.isHittable)
        creditCellLabelContains.tap()

        XCTAssertTrue(creditCallLabel.isHittable)
        creditCallLabel.tap()
    }

    func testElementMatchingIdentifier() {
        mainPage.goToTablePageMenu()

        let creditCell = app.any.element(withLocator: Locators.credit, label: "Made with love by")
        let wrongLabelCell = app.any.element(withLocator: Locators.credit, label: "")

        XCTAssertTrue(creditCell.isHittable)
        creditCell.tap()

        XCTAssertFalse(wrongLabelCell.exists)
    }

    func testCellMatching() {
        mainPage.goToTablePageMenu()

        let firstCellOfAKind = tablePage.cells.element(containingLabels: [Locators.title: "Kind A", Locators.subtitle: "1st cell"])
        let firstCellOfAKinds = tablePage.cells.element(containingLabels: [Locators.title: ["Kind A", "Rodzaj A"], Locators.subtitle: ["1st cell", "Pierwszy wiersz"]])
        let secondCellOfBKind = tablePage.cells.element(containingLabels: [Locators.title: "*B", Locators.rightDetail: "2*"], labelsComparisonOperator: .like)
        let creditCell = tablePage.cells.element(containingLabels: [Locators.credit: "with love"], labelsComparisonOperator: .contains)
        let wrongRightDetailCell = tablePage.cells.element(containingLabels: [Locators.title: "Kind B", Locators.rightDetail: "3rd"])
        let wrongIdentifierCell = tablePage.cells.element(containingLabels: [Locators.title: "Kind A", Locators.rightDetail: "3rd cell"])

        XCTAssertTrue(firstCellOfAKind.isHittable)
        firstCellOfAKind.tap()

        XCTAssertTrue(firstCellOfAKinds.isHittable)
        firstCellOfAKinds.tap()

        XCTAssertTrue(secondCellOfBKind.isHittable)
        secondCellOfBKind.tap()

        XCTAssertTrue(creditCell.isHittable)
        creditCell.tap()

        XCTAssertFalse(wrongRightDetailCell.exists)
        XCTAssertFalse(wrongIdentifierCell.exists)
    }

    func testSliderCell() {
        mainPage.goToTablePageMenu()

        let sliderCell = tablePage.cells
            .containing([
                .identifier(Locators.slider),
                .identifier(Locators.valueLabel) & .label(that: .beginsWith, ".2f")])
            .element

        XCTAssertTrue(sliderCell.isHittable)
        sliderCell.tap()

        let slider = sliderCell.sliders[Locators.slider]
        slider.adjust(to: 0.78)

        let label = sliderCell.staticTexts[Locators.valueLabel]
        XCTAssertEqual(label.label, ".2f: 0.78")
    }
}

// MARK: - Locators
private extension XCUIElementQueryTests {
    enum Locators: String, Locator {
        case title
        case subtitle
        case rightDetail
        case credit
        case slider
        case valueLabel
    }
}
