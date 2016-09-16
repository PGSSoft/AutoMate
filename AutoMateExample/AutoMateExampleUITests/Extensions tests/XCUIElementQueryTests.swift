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

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
    }

    func testElementMatchingLabel() {
        TableScreen.open(inside: app)

        let creditCellLabelDefault = app.any.element(withLabelMatching: "Made with love by")
        let creditCellLabelEquals = app.any.element(withLabelMatching: "Made with love by", comparisonOperator: .Equals)
        let creditCellLabelLike = app.any.element(withLabelMatching: "Made *", comparisonOperator: .Like)
        let creditCellLabelMatches = app.any.element(withLabelMatching: "Made.*", comparisonOperator: .Matches)
        let creditCellLabelBeginsWith = app.any.element(withLabelMatching: "Made", comparisonOperator: .BeginsWith)
        let creditCellLabelEndsWith = app.any.element(withLabelMatching: "love by", comparisonOperator: .EndsWith)
        let creditCellLabelContains = app.any.element(withLabelMatching: "with love", comparisonOperator: .Contains)

        XCTAssertTrue(creditCellLabelDefault.hittable)
        creditCellLabelDefault.tap()

        XCTAssertTrue(creditCellLabelEquals.hittable)
        creditCellLabelEquals.tap()

        XCTAssertTrue(creditCellLabelLike.hittable)
        creditCellLabelLike.tap()

        XCTAssertTrue(creditCellLabelMatches.hittable)
        creditCellLabelMatches.tap()

        XCTAssertTrue(creditCellLabelBeginsWith.hittable)
        creditCellLabelBeginsWith.tap()

        XCTAssertTrue(creditCellLabelEndsWith.hittable)
        creditCellLabelEndsWith.tap()

        XCTAssertTrue(creditCellLabelContains.hittable)
        creditCellLabelContains.tap()
    }

    func testElementMatchingIdentifier() {
        TableScreen.open(inside: app)

        let creditCell = app.any.element(withIdentifier: Identifiers.credit, label: "Made with love by")
        let wrongLabelCell = app.any.element(withIdentifier: Identifiers.credit, label: "")

        XCTAssertTrue(creditCell.hittable)
        creditCell.tap()

        XCTAssertFalse(wrongLabelCell.exists)
    }

    func testCellMatching() {
        TableScreen.open(inside: app)

        let firstCellOfAKind = app.cells.element(containingLabels: [Identifiers.title: "Kind A", Identifiers.subtitle: "1st cell"])
        let secondCellOfBKind = app.cells.element(containingLabels: [Identifiers.title: "*B", Identifiers.rightDetail: "2*"], labelsComparisonOperator: .Like)
        let creditCell = app.cells.element(containingLabels: [Identifiers.credit: "with love"], labelsComparisonOperator: .Contains)
        let wrongRightDetailCell = app.cells.element(containingLabels: [Identifiers.title: "Kind B", Identifiers.rightDetail: "3rd"])
        let wrongIdentifierCell = app.cells.element(containingLabels: [Identifiers.title: "Kind A", Identifiers.rightDetail: "3rd cell"])

        XCTAssertTrue(firstCellOfAKind.hittable)
        firstCellOfAKind.tap()

        XCTAssertTrue(secondCellOfBKind.hittable)
        secondCellOfBKind.tap()

        XCTAssertTrue(creditCell.hittable)
        creditCell.tap()

        XCTAssertFalse(wrongRightDetailCell.exists)
        XCTAssertFalse(wrongIdentifierCell.exists)
    }
}

private enum Identifiers {
    static let title = "title"
    static let subtitle = "subtitle"
    static let rightDetail = "rightDetail"
    static let credit = "credit"
}
