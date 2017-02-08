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

    fileprivate let localeIdentifier: String

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
        localeIdentifier = "\(language.rawValue)_\(country.rawValue)"
    }
}

// MARK: LaunchArgumentValue
extension SystemLocale: LaunchArgumentValue {

    /// String representation of the launch value.
    public var value: String {
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
        return software.values.combine(values: hardware.values)
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
        return ["-\(key)", "(" + values.map({ $0.value }).joined(separator: ", ") + ")"]
    }
}

// MARK: - CoreDataArgument
/// Launch option to enable debug options for CoreData.
public enum CoreDataOption {

    /// Enables SQLDebug logging with given verbosity level.
    case sqlDebug(verbosityLevel: VerbosityLevel)

    /// Turns on SQL syntax coloring.
    case syntaxColoredLogging

    /// Logs exceptions during data migrations.
    case migrationDebug

    /// Enables extra assertions related to concurrency.
    case concurrencyDebug

    /// Controls behaviour of SQLite disk syncing.
    case sqLiteDebugSynchronous(syncing: DiskSyncing)

    /// Enables extra integrity checking.
    case sqLiteIntegrityCheck

    /// Enables assertions for Core Data's multi-threading policy.
    case threadingDebug(verbosityLevel: VerbosityLevel)

    /// Describes verbosity level of log output.
    public enum VerbosityLevel: Int {

        /// Low level of logging verbosity.
        case low = 1

        /// Medium level of logging verbosity.
        case medium = 2

        /// Maximum level of logging verbosity.
        case high = 3
    }

    /// Describes how database updates should be performed.
    public enum DiskSyncing: Int {

        /// Completely disables disk syncing. Fast, but increases chance of data corruption.
        case disabled = 1

        /// Disk syncing is performed without `fctl FULL_FSYNC` command.
        case normal = 2

        /// Enforces that data is physically written to disk during save operation.
        case full = 3
    }
}

extension CoreDataOption.VerbosityLevel: LaunchArgumentValue { }

extension CoreDataOption.DiskSyncing: LaunchArgumentValue { }

extension CoreDataOption: LaunchArgumentWithSingleValue {
    /// String representation of the launch argument key.
    public var key: String {
        switch self {
        case .sqlDebug:
            return "com.apple.CoreData.SQLDebug"
        case .syntaxColoredLogging:
            return "com.apple.CoreData.SyntaxColoredLogging"
        case .migrationDebug:
            return "com.apple.CoreData.MigrationDebug"
        case .concurrencyDebug:
            return "com.apple.CoreData.ConcurrencyDebug"
        case .sqLiteDebugSynchronous:
            return "com.apple.CoreData.SQLiteDebugSynchronous"
        case .sqLiteIntegrityCheck:
            return "com.apple.CoreData.SQLiteIntegrityCheck"
        case .threadingDebug:
            return "com.apple.CoreData.ThreadingDebug"
        }
    }

    /// Launch argument value to use during serialization.
    public var value: LaunchArgumentValue {
        switch self {
        case let .sqlDebug(value):
            return value
        case let .sqLiteDebugSynchronous(value):
            return value
        case let .threadingDebug(value):
            return value
        case .syntaxColoredLogging, .migrationDebug, .concurrencyDebug, .sqLiteIntegrityCheck:
            return BooleanLaunchArgumentValue.true
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
        return BooleanLaunchArgumentValue.true
    }

    /// String representation of the launch argument key.
    public var key: String {
        return rawValue
    }
}
