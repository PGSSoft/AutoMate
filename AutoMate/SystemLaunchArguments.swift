//
//  SystemLaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

public struct SystemLanguages: LanguageLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    public let values: [SystemLanguage]

    public init(_ values: [SystemLanguage]) {
        self.values = values
    }
}

public struct SystemLocale: LocaleLaunchArgument, LaunchArgumentWithSingleValue {

    private let localeIdentifier: String

    public init(localeIdentifier: String) {
        self.localeIdentifier = localeIdentifier
    }

    public init(language: SystemLanguage, country: SystemCountry) {
        self.localeIdentifier = "\(language.rawValue)_\(country.rawValue)"
    }
}

// MARK: LaunchArgumentValue
extension SystemLocale: LaunchArgumentValue {

    public var launchArgument: String {
        return "\"\(localeIdentifier)\""
    }
}

public struct SoftwareKeyboards: KeyboardLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    public var values: [SoftwareKeyboard]

    public init(_ values: [SoftwareKeyboard]) {
        self.values = values
    }
}

public struct HardwareKeyboards: KeyboardLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    public var values: [HardwareKeyboard]

    public init(_ values: [HardwareKeyboard]) {
        self.values = values
    }
}

public struct SystemKeyboards: KeyboardLaunchArgument {

    private let software: SoftwareKeyboards
    private let hardware: HardwareKeyboards

    public var values: [LaunchArgumentValue] {
        return software.values.combineValues(hardware.values)
    }

    public init(software: SoftwareKeyboards = [], hardware: HardwareKeyboards = []) {
        self.software = software
        self.hardware = hardware
    }

    public var launchArguments: [String]? {
        return ["-\(argumentKey)", "(" + values.map({ $0.launchArgument }).joinWithSeparator(", ") + ")"]
    }
}

// MARK: - CoreDataArgument
public enum CoreDataArgument {
    case SQLDebug(verbosityLevel: VerbosityLevel)
    case SyntaxColoredLogging
    case MigrationDebug
    case ConcurrencyDebug
    case SQLiteDebugSynchronous(syncing: DiskSyncing)
    case SQLiteIntegrityCheck
    case ThreadingDebug(verbosityLevel: VerbosityLevel)

    public enum VerbosityLevel: Int {
        case Low = 1
        case Medium = 2
        case High = 3
    }

    public enum DiskSyncing: Int {
        case Disabled = 1
        case Normal = 2
        case Full = 3
    }
}

extension CoreDataArgument.VerbosityLevel : LaunchArgumentValue {}

extension CoreDataArgument.DiskSyncing : LaunchArgumentValue {}

extension CoreDataArgument: SingleArgumentOption {
    public var argumentKey: String {
        switch self {
        case SQLDebug:
            return "com.apple.CoreData.SQLDebug"
        case SyntaxColoredLogging:
            return "com.apple.CoreData.SyntaxColoredLogging"
        case MigrationDebug:
            return "com.apple.CoreData.MigrationDebug"
        case ConcurrencyDebug:
            return "com.apple.CoreData.ConcurrencyDebug"
        case SQLiteDebugSynchronous:
            return "com.apple.CoreData.SQLiteDebugSynchronous"
        case SQLiteIntegrityCheck:
            return "com.apple.CoreData.SQLiteIntegrityCheck"
        case ThreadingDebug:
            return "com.apple.CoreData.ThreadingDebug"
        }
    }

    public var value: LaunchArgumentValue {
        switch self {
        case let SQLDebug(value):
            return value
        case let SQLiteDebugSynchronous(value):
            return value
        case let ThreadingDebug(value):
            return value
        case SyntaxColoredLogging, MigrationDebug, ConcurrencyDebug, SQLiteIntegrityCheck:
            return BooleanLaunchArgumentValue.True
        }
    }
}


// MARK: - LocalizedStringArgument
public enum LocalizedStringsArgument: String {
    case DoubleLocalizedStrings = "NSDoubleLocalizedStrings"
    case ShowNonLocalizedStrings = "NSShowNonLocalizedStrings"
}

extension LocalizedStringsArgument: SingleArgumentOption {
    public var value: LaunchArgumentValue {
        return BooleanLaunchArgumentValue.True
    }

    public var argumentKey: String {
        return rawValue
    }
}
