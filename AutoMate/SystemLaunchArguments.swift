//
//  SystemLaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

/// Launch option to replace languages selected in the system.
public struct SystemLanguages: LanguageLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    /// System languages to set on device. First element is the most preffered one.
    public let values: [SystemLanguage]

    /**
     Initalizes `self` with array of languages.
     - parameter values: Array to use for initialization.
     */
    public init(_ values: [SystemLanguage]) {
        self.values = values
    }
}

/// Launch option to replace locale selected in the system.
public struct SystemLocale: LocaleLaunchArgument, LaunchArgumentWithSingleValue {

    private let localeIdentifier: String

    /**
     Initalizes `self` with custom string representation of the locale.
     - parameter localeIdentifier: String representation of the locale.
     */
    public init(localeIdentifier: String) {
        self.localeIdentifier = localeIdentifier
    }

    /**
     Initalizes `self` with predefined language and country.
     - parameter language: Predefined language value.
     - parameter country: Predefined country value.
     */
    public init(language: SystemLanguage, country: SystemCountry) {
        self.localeIdentifier = "\(language.rawValue)_\(country.rawValue)"
    }
}

// MARK: LaunchArgumentValue
extension SystemLocale: LaunchArgumentValue {

    /// String representation of the launch value.
    public var launchArgument: String {
        return "\"\(localeIdentifier)\""
    }
}

/// Launch option to replace software keyboards selected in the system.
public struct SoftwareKeyboards: KeyboardLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    /// Software keyboards to set on device. First element is the most preffered one.
    public var values: [SoftwareKeyboard]

    /**
     Initalizes `self` with array of software keyboards.
     - parameter values: Array to use for initialization.
     */
    public init(_ values: [SoftwareKeyboard]) {
        self.values = values
    }
}

/// Launch option to replace hardware keyboards selected in the system.
public struct HardwareKeyboards: KeyboardLaunchArgument, LaunchArgumentWithMultipleValues {

    // MARK: LaunchArgumentWithMultipleValues
    /// Hardware keyboards to set on device. First element is the most preffered one.
    public var values: [HardwareKeyboard]

    /**
     Initalizes `self` with array of hardware keyboards.
     - parameter values: Array to use for initialization.
     */
    public init(_ values: [HardwareKeyboard]) {
        self.values = values
    }
}

/// Launch option to replace system keyboards selected in the system.
public struct SystemKeyboards: KeyboardLaunchArgument {

    private let software: SoftwareKeyboards
    private let hardware: HardwareKeyboards

    /// Keyboards to set on device.
    public var values: [LaunchArgumentValue] {
        return software.values.combineValues(hardware.values)
    }

    /**
     Initalizes `self` with arrays of hardware and software keyboards..
     - parameter software: Array of software keyboards.
     - parameter hardware: Array of hardware keyboards.
     */
    public init(software: SoftwareKeyboards = [], hardware: HardwareKeyboards = []) {
        self.software = software
        self.hardware = hardware
    }

    /// Hardware keyboards to set on device. First element is the most preffered one.
    public var launchArguments: [String]? {
        return ["-\(argumentKey)", "(" + values.map({ $0.launchArgument }).joinWithSeparator(", ") + ")"]
    }
}

// MARK: - CoreDataArgument
/// Launch option to enable debug options for CoreData.
public enum CoreDataOption {

    /// Enables SQLDebug logging with given verbosity level.
    case SQLDebug(verbosityLevel: VerbosityLevel)

    /// Turns on SQL syntax coloring.
    case SyntaxColoredLogging

    /// Logs exceptions during data migrations.
    case MigrationDebug

    /// Enables extra assertions related to concurrency.
    case ConcurrencyDebug

    /// Controls behaviour of SQLite disk syncing.
    case SQLiteDebugSynchronous(syncing: DiskSyncing)

    /// Enables extra integrity checking.
    case SQLiteIntegrityCheck

    /// Enables assertions for Core Data's multi-threading policy.
    case ThreadingDebug(verbosityLevel: VerbosityLevel)

    /// Describes verbosity level of log output.
    public enum VerbosityLevel: Int {

        /// Low level of logging verbosity.
        case Low = 1

        /// Medium level of logging verbosity.
        case Medium = 2

        /// Maximum level of logging verbosity.
        case High = 3
    }

    /// Describes how database updates should be performed.
    public enum DiskSyncing: Int {

        /// Completely disables disk syncing. Fast, but increases chance of data corruption.
        case Disabled = 1

        /// Disk syncing is performed without `fctl FULL_FSYNC` command.
        case Normal = 2

        /// Enforces that data is physically written to disk during save operation.
        case Full = 3
    }
}

extension CoreDataOption.VerbosityLevel: LaunchArgumentValue { }

extension CoreDataOption.DiskSyncing: LaunchArgumentValue { }

extension CoreDataOption: LaunchArgumentWithSingleValue {
    /// String representation of the launch argument key.
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

    /// Launch argument value to use during serialization.
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

/// Launch option to enable debug settings for string localization.
public enum LocalizedStrings: String {

    /// Makes all localized strings twice as long.
    case DoubleLocalizedStrings = "NSDoubleLocalizedStrings"

    /// Capitalizes all untranslated strings in the application.
    case ShowNonLocalizedStrings = "NSShowNonLocalizedStrings"
}

extension LocalizedStrings: LaunchArgumentWithSingleValue {
    /// Launch argument value to use during serialization.
    public var value: LaunchArgumentValue {
        return BooleanLaunchArgumentValue.True
    }

    /// String representation of the launch argument key.
    public var argumentKey: String {
        return rawValue
    }
}
