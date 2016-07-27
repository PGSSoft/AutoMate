//
//  SystemLaunchArgumentsTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 29/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import XCTest
@testable import AutoMate

class SystemLaunchArgumentsTests: XCTestCase {
    func build(input: [LaunchOption]) -> [String] {
        var app = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: input)
        app = launcher.configure(app)

        XCTAssertEqual(app.launchEnvironment, [:])
        return app.launchArguments
    }

    func testLanguageArgument() {
        func buildLanguage(input: [SystemLanguages]) -> [String] {
            let result = build([SystemLanguageArgument(input)])
            return result
        }

        XCTAssertEqual(buildLanguage([]), ["-AppleLanguages", "()"])
        XCTAssertEqual(buildLanguage([SystemLanguages.Polish]), ["-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(buildLanguage([SystemLanguages.Polish, SystemLanguages.Polish]), ["-AppleLanguages", "(\"pl\", \"pl\")"])
        XCTAssertEqual(buildLanguage([SystemLanguages.Polish, SystemLanguages.English]), ["-AppleLanguages", "(\"pl\", \"en\")"])
    }

    func testLocaleArgument() {
        let l1 = SystemLocaleArgument(localeIdentifier: "pl")
        let l2 = SystemLocaleArgument(language: .Polish, country: .Afghanistan)
        let l3 = SystemLocaleArgument(language: .English, country: .Afghanistan)
        let l4 = SystemLocaleArgument(language: .English, country: .USA)
        let l5 = SystemLocaleArgument(localeIdentifier: "garbage")

        XCTAssertEqual(build([l1]), ["-AppleLocale", "\"pl\""])
        XCTAssertEqual(build([l2]), ["-AppleLocale", "\"pl_AF\""])
        XCTAssertEqual(build([l3]), ["-AppleLocale", "\"en_AF\""])
        XCTAssertEqual(build([l4]), ["-AppleLocale", "\"en_US\""])
        XCTAssertEqual(build([l5]), ["-AppleLocale", "\"garbage\""])
        XCTAssertEqual(build([l1, l2, l3, l4]), ["-AppleLocale", "\"pl\""])
    }

    func testKeyboardArgument() {
        let hardware = SystemHardwareKeyboardArgument([HardwareKeyboards.Bengali])
        let software = SystemSoftwareKeyboardArgument(arrayLiteral: SoftwareKeyboards.Bengali)
        let keyboard = SystemKeyboardArgument(software: software, hardware: hardware)

        XCTAssertEqual(build([hardware]), ["-AppleKeyboards", "(\"bn@hw=Bangla\")"])
        XCTAssertEqual(build([software]), ["-AppleKeyboards", "(\"bn@sw=Bengali\")"])
        XCTAssertEqual(build([keyboard]), ["-AppleKeyboards", "(\"bn@sw=Bengali\", \"bn@hw=Bangla\")"])
    }

    func testCombined() {
        let locale = SystemLocaleArgument(localeIdentifier: "pl")
        let keyboard = SystemHardwareKeyboardArgument([HardwareKeyboards.Bengali])
        let language = SystemLanguageArgument([.Polish])

        XCTAssertEqual(build([]), [])
        XCTAssertEqual(build([locale, keyboard]), ["-AppleLocale", "\"pl\"", "-AppleKeyboards", "(\"bn@hw=Bangla\")"])
        XCTAssertEqual(build([locale, language]), ["-AppleLocale", "\"pl\"", "-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(build([keyboard, language]), ["-AppleKeyboards", "(\"bn@hw=Bangla\")", "-AppleLanguages", "(\"pl\")"])
        XCTAssertEqual(build([locale, keyboard, language]), ["-AppleLocale", "\"pl\"", "-AppleKeyboards", "(\"bn@hw=Bangla\")", "-AppleLanguages", "(\"pl\")"])
    }

    func testCoreDataArguments() {
        XCTAssertEqual(build([CoreDataArgument.SQLDebug(verbosityLevel: .Low)]), ["-com.apple.CoreData.SQLDebug", "\"1\""])
        XCTAssertEqual(build([CoreDataArgument.SQLDebug(verbosityLevel: .Medium)]), ["-com.apple.CoreData.SQLDebug", "\"2\""])
        XCTAssertEqual(build([CoreDataArgument.SQLDebug(verbosityLevel: .High)]), ["-com.apple.CoreData.SQLDebug", "\"3\""])

        XCTAssertEqual(build([CoreDataArgument.SQLiteDebugSynchronous(syncing: .Disabled)]), ["-com.apple.CoreData.SQLiteDebugSynchronous", "\"1\""])

        XCTAssertEqual(build([CoreDataArgument.SyntaxColoredLogging]), ["-com.apple.CoreData.SyntaxColoredLogging", "\"1\""])

        XCTAssertEqual(build([CoreDataArgument.MigrationDebug]), ["-com.apple.CoreData.MigrationDebug", "\"1\""])

        XCTAssertEqual(build([CoreDataArgument.ConcurrencyDebug]), ["-com.apple.CoreData.ConcurrencyDebug", "\"1\""])

        XCTAssertEqual(build([CoreDataArgument.SQLiteIntegrityCheck]), ["-com.apple.CoreData.SQLiteIntegrityCheck", "\"1\""])

        XCTAssertEqual(build([CoreDataArgument.ThreadingDebug(verbosityLevel: .Low)]), ["-com.apple.CoreData.ThreadingDebug", "\"1\""])

        //test two equal keys
        XCTAssertEqual(build([CoreDataArgument.ConcurrencyDebug, CoreDataArgument.ConcurrencyDebug]), ["-com.apple.CoreData.ConcurrencyDebug", "\"1\""])

        //test two different keys
        XCTAssertEqual(build([CoreDataArgument.ConcurrencyDebug, CoreDataArgument.SQLiteIntegrityCheck]),
                       ["-com.apple.CoreData.ConcurrencyDebug", "\"1\"", "-com.apple.CoreData.SQLiteIntegrityCheck", "\"1\""])
    }

    func testLocalizedString() {
        XCTAssertEqual(build([LocalizedStringsArgument.ShowNonLocalizedStrings]), ["-NSShowNonLocalizedStrings", "\"YES\""])
        XCTAssertEqual(build([LocalizedStringsArgument.DoubleLocalizedStrings]), ["-NSDoubleLocalizedStrings", "\"YES\""])
    }

}
