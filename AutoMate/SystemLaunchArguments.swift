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
