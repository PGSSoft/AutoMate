//
//  XCUIElementQueryTests.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 07/09/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest

class XCUIElementQueryTests: XCTestCase {
    let app = XCUIApplication()
    lazy var mainScreen: MainScreen = MainScreen(app: self.app)

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
        wait(forElementToExist: mainScreen.tableView, timeout: 30)
    }

    func testElementMatchingLabel() {
        _ = TableScreen.open(inside: app)

        let creditCellLabelDefault = app.any.element(withLabelMatching: "Made with love by")
        let creditCellLabelEquals = app.any.element(withLabelMatching: "Made with love by", comparisonOperator: .equals)
        let creditCellLabelLike = app.any.element(withLabelMatching: "Made *", comparisonOperator: .like)
        let creditCellLabelMatches = app.any.element(withLabelMatching: "Made.*", comparisonOperator: .matches)
        let creditCellLabelBeginsWith = app.any.element(withLabelMatching: "Made", comparisonOperator: .beginsWith)
        let creditCellLabelEndsWith = app.any.element(withLabelMatching: "love by", comparisonOperator: .endsWith)
        let creditCellLabelContains = app.any.element(withLabelMatching: "with love", comparisonOperator: .contains)

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
    }

    func testElementMatchingIdentifier() {
        _ = TableScreen.open(inside: app)

        let creditCell = app.any.element(withIdentifier: Identifiers.credit, label: "Made with love by")
        let wrongLabelCell = app.any.element(withIdentifier: Identifiers.credit, label: "")

        XCTAssertTrue(creditCell.isHittable)
        creditCell.tap()

        XCTAssertFalse(wrongLabelCell.exists)
    }

    func testCellMatching() {
        _ = TableScreen.open(inside: app)

        let firstCellOfAKind = app.cells.element(containingLabels: [Identifiers.title: "Kind A", Identifiers.subtitle: "1st cell"])
        let secondCellOfBKind = app.cells.element(containingLabels: [Identifiers.title: "*B", Identifiers.rightDetail: "2*"], labelsComparisonOperator: .like)
        let creditCell = app.cells.element(containingLabels: [Identifiers.credit: "with love"], labelsComparisonOperator: .contains)
        let wrongRightDetailCell = app.cells.element(containingLabels: [Identifiers.title: "Kind B", Identifiers.rightDetail: "3rd"])
        let wrongIdentifierCell = app.cells.element(containingLabels: [Identifiers.title: "Kind A", Identifiers.rightDetail: "3rd cell"])

        XCTAssertTrue(firstCellOfAKind.isHittable)
        firstCellOfAKind.tap()

        XCTAssertTrue(secondCellOfBKind.isHittable)
        secondCellOfBKind.tap()

        XCTAssertTrue(creditCell.isHittable)
        creditCell.tap()

        XCTAssertFalse(wrongRightDetailCell.exists)
        XCTAssertFalse(wrongIdentifierCell.exists)
    }

    // MARK: Test for movie
    func testForMovie() {
        testCellMatching()
        TableScreen.closeView(in: app)
    }
}

private enum Identifiers {
    static let title = "title"
    static let subtitle = "subtitle"
    static let rightDetail = "rightDetail"
    static let credit = "credit"
}
