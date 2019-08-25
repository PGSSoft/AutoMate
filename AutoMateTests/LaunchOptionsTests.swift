//
//  LaunchOptionsTests.swift
//  AutoMateTests
//
//  Created by Joanna Bednarz on 25/08/2019.
//  Copyright © 2019 PGS Software. All rights reserved.
//

import XCTest

class LaunchOptionsTests: XCTestCase {

    let singleRawValueCleanedEnv = SingleValueCleanableEnvironment(rawValue: "simple_value", shouldCleanBefore: true)
    let singleRawValueEnv = SingleValueCleanableEnvironment(rawValue: "simple_value_not_cleaned", shouldCleanBefore: false)

    func testRawValueIsLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueEnv.value, "simple_value_not_cleaned")
    }
    
    func testCleanFlagIsAddedToCleanedLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueCleanedEnv.launchEnvironments, [singleRawValueCleanedEnv.key: "AM_CLEAN_DATA_FLAG,simple_value"])
    }
    
    func testCleanFlagIsNotAddedToNotCleanedLaunchEnvironmentsValue() {
        XCTAssertEqual(singleRawValueEnv.launchEnvironments, [singleRawValueCleanedEnv.key: "simple_value_not_cleaned"])
    }
}
