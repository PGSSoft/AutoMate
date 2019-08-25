//
//  LaunchOptionsTests.swift
//  AutoMateTests
//
//  Created by Joanna Bednarz on 25/08/2019.
//  Copyright © 2019 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class LaunchOptionsTests: XCTestCase {

    let singleRawValueCleanedEnv = SingleValueCleanableEnvironment(rawValue: "simple_value", shouldCleanBefore: true)
    let singleRawValueEnv = SingleValueCleanableEnvironment(rawValue: "simple_value_not_cleaned", shouldCleanBefore: false)

    func testRawValueIsLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueEnv.value, "simple_value_not_cleaned")
    }
    
    func testCleanFlagIsAddedToCleanedLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueCleanedEnv.launchEnvironments,
                       [singleRawValueCleanedEnv.key: "AM_CLEAN_DATA_FLAG,simple_value"])
    }
    
    func testCleanFlagIsNotAddedToNotCleanedLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueEnv.launchEnvironments,
                       [singleRawValueCleanedEnv.key: "simple_value_not_cleaned"])
    }
    
    func testCleanFlagIsNotAddedToNotCleanedMultiLaunchEnvironmentsValues() {
        let sut = MultipleValuesCleanableEnvironment(valuesCollection: ["value_one", "value_two"])
        XCTAssertEqual(sut.launchEnvironments,
                       ["MultipleValuesCleanableEnvironment": "value_one,value_two"])
    }
    
    func testCleanFlagIsAddedToCleanedMultiLaunchEnvironmentsValues() {
        let sut = MultipleValuesCleanableEnvironment(shouldCleanBefore: true, valuesCollection: ["value_one_cleaned", "value_two_cleaned"])
        XCTAssertEqual(sut.launchEnvironments, ["MultipleValuesCleanableEnvironment": "AM_CLEAN_DATA_FLAG,value_one_cleaned,value_two_cleaned"])
    }
    
    func testLaunchEnvironmentsOfMultiValueEnvironment() {
        let sut: MultipleValuesEnvironment = ["simple_value_one", "simple_value_two"]
        XCTAssertEqual(sut.launchEnvironments,
                       ["MultipleValuesEnvironment": "simple_value_one,simple_value_two"])
    }
    
    func testBooleanLaunchArgumentValueFromBoolLiteral() {
        let trueArgumentValue: BooleanLaunchArgumentValue = true
        XCTAssertEqual(trueArgumentValue, .true)
        
        
        let falseArgumentValue: BooleanLaunchArgumentValue = false
        XCTAssertEqual(falseArgumentValue, .false)
    }
}
