//
//  LaunchOptionsSetTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
@testable import AutoMate

class LaunchOptionsSetTests: XCTestCase {

    let option = LaunchOptionsFactory.singleSoftwareKeyboardLaunchArgument
    let option1 = LaunchOptionsFactory.singleLanguageLaunchArgument

    func testArrayLiteralInitialization() {
        let set: LaunchOptionsSet = [option]
        XCTAssertFalse(set.isEmpty)
    }

    func testContaintsToDetectValueAlreadyStored() {
        let set: LaunchOptionsSet = [option]
        XCTAssertTrue(set.contains(option))
    }

    func testContaintsToDetectValueNotStored() {
        let set: LaunchOptionsSet = []
        XCTAssertFalse(set.contains(option))
    }

    func testInsertWithNotStoredValue() {
        var set: LaunchOptionsSet = []
        _ = set.insert(option)
        XCTAssertTrue(set.contains(option))
    }

    func testInsertWithAlreadyStoredValue() {
        var set1: LaunchOptionsSet = [option]
        let set2 = set1
        _ = set1.insert(option)
        XCTAssertTrue(set1 == set2)
    }

    func testExlusiveOrToReturnEmptySetForEqualSets() {
        let set1: LaunchOptionsSet = [option]
        XCTAssertTrue(set1.symmetricDifference(set1).isEmpty)
    }

    func testExlusiveOrToReturnNotEmptySetForDisjointSets() {
        let set1: LaunchOptionsSet = [option]
        let set2: LaunchOptionsSet = [option1]
        let resultSet = set1.symmetricDifference(set2)
        XCTAssertTrue(resultSet.contains(option1))
        XCTAssertTrue(resultSet.contains(option))
    }

    func testStoredElementRemove() {
        var set: LaunchOptionsSet = [option]
        let removedOption = set.remove(option)
        XCTAssertNotNil(removedOption)
        XCTAssertTrue(removedOption!.uniqueIdentifier == option.uniqueIdentifier)
        XCTAssertTrue(set.isEmpty)
    }

    func testRemoveOfNotStoredElement() {
        let set: LaunchOptionsSet = [option]
        var mutableSet = set
        let removedOption = mutableSet.remove(option1)
        XCTAssertNil(removedOption)
        XCTAssertTrue(mutableSet == set)
    }

    func testDisjointSetsIntersectionToBeEmpty() {
        let set1: LaunchOptionsSet = [option]
        let set2: LaunchOptionsSet = [option1]
        XCTAssertTrue(set1.isDisjoint(with: set2))
    }

    func testIntersectionOfSetsWithCommonElement() {
        let set1: LaunchOptionsSet = [option]
        let set2: LaunchOptionsSet = [option, option1]
        let resultSet = set1.intersection(set2)
        XCTAssertTrue(resultSet.contains(option))
        XCTAssertFalse(resultSet.contains(option1))
    }

    func testDisjointSetsUnion() {
        let set1: LaunchOptionsSet = [option]
        let set2: LaunchOptionsSet = [option1]
        let resultSet = set1.union(set2)
        XCTAssertTrue(resultSet.contains(option))
        XCTAssertTrue(resultSet.contains(option1))
    }
}
