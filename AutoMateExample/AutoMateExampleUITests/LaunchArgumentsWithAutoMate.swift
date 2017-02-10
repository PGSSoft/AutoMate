//
//  AutoMateExampleUITests.swift
//  AutoMateExampleUITests
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class LaunchArgumentsWithAutomate: XCTestCase {

    // MARK: Setup
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        let app = XCUIApplication()
        let launcher = TestLauncher(options: [
                                        SystemLanguages([.Polish]),
                                        SystemLocale(language: .Polish, country: .Poland),
                                        SystemKeyboards(
                                                        software: SoftwareKeyboards([.PolishPoland]),
                                                        hardware: HardwareKeyboards([.PolishPoland])
                                        )
                                    ])
        launcher.configure(app).launch()
    }

    // MARK: Tests
    func testSomething() {

    }

}
