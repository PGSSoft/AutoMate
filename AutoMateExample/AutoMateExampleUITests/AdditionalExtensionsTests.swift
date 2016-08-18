//
//  XCUIElementExtensionTests.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 17/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class AdditionalExtensionsTests: XCTestCase {
    let app = XCUIApplication()

    // MARK: Setup
    override func setUp() {
        super.setUp()
        app.launch()
    }

    // MARK: XCTestCase extension tests
    func testWaitForElementToExist() {
        let screen = AppearingScreen.open(inside: app)
        XCTAssertFalse(screen.buttonNotExisting.exists)

        waitForElementToExist(screen.buttonNotExisting)
        XCTAssert(screen.buttonNotExisting.exists)
    }

    func testWaitForVisibleElement() {
        let screen = AppearingScreen.open(inside: app)
        XCTAssertFalse(screen.buttonAppearing.isVisible)

        waitForVisibleElement(screen.buttonAppearing)
        XCTAssert(screen.buttonAppearing.isVisible)
    }

    // MARK: XCUIApplication extension tests
    func testDeviceType() {
        print(
            app.deviceType,
            app.actualDeviceType,
            app.isRunningOnSimulator,
            app.isRunningOn(.iPad),
            app.isRunningOn(.iPhone40),
            app.isRunningOnIpad,
            app.isRunningOnIphone)
    }

    // MARK: XCUIElementTypeQueryProvider tests
    func testAny() {
        XCTAssert(app.any.elementBoundByIndex(0).exists)
    }

    // MARK: XCTElementQuery extension tests
    func testElementMatchingLabel() {
        TableScreen.open(inside: app)
        XCTAssert(app.any.element(withLabelMatching: "UniqueName").hittable)
        XCTAssert(app.any.element(withLabelMatching: "UniqueName", comparisonOperator: .Equals).hittable)
        XCTAssert(app.any.element(withLabelMatching: "Unique*", comparisonOperator: .Like).hittable)
        XCTAssert(app.any.element(withLabelMatching: "Unique.*", comparisonOperator: .Matches).hittable)
        XCTAssert(app.any.element(withLabelMatching: "Unique", comparisonOperator: .BeginsWith).hittable)
        XCTAssert(app.any.element(withLabelMatching: "Name", comparisonOperator: .EndsWith).hittable)
        XCTAssert(app.any.element(withLabelMatching: "nique", comparisonOperator: .Contains).hittable)
    }

    func testElementMatchingIdentifier() {
        TableScreen.open(inside: app)

        XCTAssert(app.any.element(withIdentifier: "unique-name", label: "UniqueName").hittable)
        XCTAssertFalse(app.any.element(withIdentifier: "unique-name", label: "").exists)
    }

    func testCellMatching() {
        TableScreen.open(inside: app)

        XCTAssert(app.cells.element(containingLabels: ["a": "KindA", "b": "Name1"]).hittable)
        XCTAssert(app.cells.element(containingLabels: ["a": "*A", "b": "*1"], labelsComparisonOperator: .Like).hittable)
        XCTAssertFalse(app.cells.element(containingLabels: ["aa": "KindA", "bb": "Name1"]).exists)
        XCTAssertFalse(app.cells.element(containingLabels: ["a": "KindAA", "b": "Name11"]).exists)
    }
}
