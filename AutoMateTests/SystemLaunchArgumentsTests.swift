//
//  SystemLaunchArgumentsTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 29/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class SystemLaunchArgumentsTests: XCTestCase {
    func build(input: [LaunchOption]) -> [String] {
        var app = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: input)
        app = launcher.configure(app)

        XCTAssertEqual(app.launchEnvironment, [:])
        return app.launchArguments
    }

    func testLanguageLaunchArgument() {
        func buildLanguage(input: [SystemLanguage]) -> [String] {
            let result = build([SystemLanguages(input)])
            return result
        }

        XCTAssertEqual(buildLanguage([]), ["-AppleLanguages", "()"])
        XCTAssertEqual(buildLanguage([SystemLanguage.Polish]), ["-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(buildLanguage([SystemLanguage.Polish, SystemLanguage.Polish]), ["-AppleLanguages", "(\"pl\", \"pl\")"])
        XCTAssertEqual(buildLanguage([SystemLanguage.Polish, SystemLanguage.English]), ["-AppleLanguages", "(\"pl\", \"en\")"])
    }

    func testLocaleLaunchArgument() {
        let l1 = SystemLocale(localeIdentifier: "pl")
        let l2 = SystemLocale(language: .Polish, country: .Afghanistan)
        let l3 = SystemLocale(language: .English, country: .Afghanistan)
        let l4 = SystemLocale(language: .English, country: .USA)
        let l5 = SystemLocale(localeIdentifier: "garbage")

        XCTAssertEqual(build([l1]), ["-AppleLocale", "\"pl\""])
        XCTAssertEqual(build([l2]), ["-AppleLocale", "\"pl_AF\""])
        XCTAssertEqual(build([l3]), ["-AppleLocale", "\"en_AF\""])
        XCTAssertEqual(build([l4]), ["-AppleLocale", "\"en_US\""])
        XCTAssertEqual(build([l5]), ["-AppleLocale", "\"garbage\""])
        XCTAssertEqual(build([l1, l2, l3, l4]), ["-AppleLocale", "\"pl\""])
    }

    func testKeyboardLaunchArgument() {
        let hardware = HardwareKeyboards([HardwareKeyboard.Bengali])
        let software = SoftwareKeyboards(arrayLiteral: SoftwareKeyboard.Bengali)
        let keyboard = SystemKeyboards(software: software, hardware: hardware)

        XCTAssertEqual(build([hardware]), ["-AppleKeyboards", "(\"bn@hw=Bangla\")"])
        XCTAssertEqual(build([software]), ["-AppleKeyboards", "(\"bn@sw=Bengali\")"])
        XCTAssertEqual(build([keyboard]), ["-AppleKeyboards", "(\"bn@sw=Bengali\", \"bn@hw=Bangla\")"])
    }

    func testCombined() {
        let locale = SystemLocale(localeIdentifier: "pl")
        let keyboard = HardwareKeyboards([HardwareKeyboard.Bengali])
        let language = SystemLanguages([.Polish])

        XCTAssertEqual(build([]), [])
        XCTAssertEqual(build([locale, keyboard]), ["-AppleLocale", "\"pl\"", "-AppleKeyboards", "(\"bn@hw=Bangla\")"])
        XCTAssertEqual(build([locale, language]), ["-AppleLocale", "\"pl\"", "-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(build([keyboard, language]), ["-AppleKeyboards", "(\"bn@hw=Bangla\")", "-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(build([locale, keyboard, language]), ["-AppleLocale", "\"pl\"", "-AppleKeyboards", "(\"bn@hw=Bangla\")", "-AppleLanguages", "(\"pl\")"])
    }

    func testCoreDataArguments() {
        XCTAssertEqual(build([CoreDataOption.SQLDebug(verbosityLevel: .Low)]), ["-com.apple.CoreData.SQLDebug", "\"1\""])
        XCTAssertEqual(build([CoreDataOption.SQLDebug(verbosityLevel: .Medium)]), ["-com.apple.CoreData.SQLDebug", "\"2\""])
        XCTAssertEqual(build([CoreDataOption.SQLDebug(verbosityLevel: .High)]), ["-com.apple.CoreData.SQLDebug", "\"3\""])

        XCTAssertEqual(build([CoreDataOption.SQLiteDebugSynchronous(syncing: .Disabled)]), ["-com.apple.CoreData.SQLiteDebugSynchronous", "\"1\""])

        XCTAssertEqual(build([CoreDataOption.SyntaxColoredLogging]), ["-com.apple.CoreData.SyntaxColoredLogging", "\"1\""])

        XCTAssertEqual(build([CoreDataOption.MigrationDebug]), ["-com.apple.CoreData.MigrationDebug", "\"1\""])

        XCTAssertEqual(build([CoreDataOption.ConcurrencyDebug]), ["-com.apple.CoreData.ConcurrencyDebug", "\"1\""])

        XCTAssertEqual(build([CoreDataOption.SQLiteIntegrityCheck]), ["-com.apple.CoreData.SQLiteIntegrityCheck", "\"1\""])

        XCTAssertEqual(build([CoreDataOption.ThreadingDebug(verbosityLevel: .Low)]), ["-com.apple.CoreData.ThreadingDebug", "\"1\""])

        //test two equal keys
        XCTAssertEqual(build([CoreDataOption.ConcurrencyDebug, CoreDataOption.ConcurrencyDebug]), ["-com.apple.CoreData.ConcurrencyDebug", "\"1\""])

        //test two different keys
        XCTAssertEqual(build([CoreDataOption.ConcurrencyDebug, CoreDataOption.SQLiteIntegrityCheck]),
                       ["-com.apple.CoreData.ConcurrencyDebug", "\"1\"", "-com.apple.CoreData.SQLiteIntegrityCheck", "\"1\""])
    }

    func testLocalizedString() {
        XCTAssertEqual(build([LocalizedStrings.ShowNonLocalizedStrings]), ["-NSShowNonLocalizedStrings", "\"1\""])
        XCTAssertEqual(build([LocalizedStrings.DoubleLocalizedStrings]), ["-NSDoubleLocalizedStrings", "\"1\""])
    }

}