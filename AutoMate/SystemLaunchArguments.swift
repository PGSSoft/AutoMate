//
//  SystemLaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

public struct SystemLanguageArgument: LanguageArgument, CollectionArgumentOption {

    // MARK: CollectionArgumetOption
    public let values: [SystemLanguages]

    public init(_ values: [SystemLanguages]) {
        self.values = values
    }
}

public struct SystemLocaleArgument: LocaleArgument, SingleArgumentOption {

    private let localeIdentifier: String

    public init(localeIdentifier: String) {
        self.localeIdentifier = localeIdentifier
    }

    public init(language: SystemLanguages, country: SystemCountries) {
        self.localeIdentifier = "\(language.rawValue)_\(country.rawValue)"
    }
}

// MARK: LaunchArgumentValue
extension SystemLocaleArgument: LaunchArgumentValue {

    public var launchArgument: String {
        return "\"\(localeIdentifier)\""
    }
}

public struct SystemSoftwareKeyboardArgument: KeyboardArgument, CollectionArgumentOption {

    // MARK: CollectionArgumetOption
    public var values: [SoftwareKeyboards]

    public init(_ values: [SoftwareKeyboards]) {
        self.values = values
    }
}

public struct SystemHardwareKeyboardArgument: KeyboardArgument, CollectionArgumentOption {

    // MARK: CollectionArgumetOption
    public var values: [HardwareKeyboards]

    public init(_ values: [HardwareKeyboards]) {
        self.values = values
    }
}

public struct SystemKeyboardArgument: KeyboardArgument {

    private let software: SystemSoftwareKeyboardArgument
    private let hardware: SystemHardwareKeyboardArgument

    public var values: [LaunchArgumentValue] {
        return software.values.combineValues(hardware.values)
    }

    public init(software: SystemSoftwareKeyboardArgument = [], hardware: SystemHardwareKeyboardArgument = []) {
        self.software = software
        self.hardware = hardware
    }

    public var launchArguments: [String]? {
        return ["-\(argumentKey)", "(" + values.map({ $0.launchArgument }).joinWithSeparator(", ") + ")"]
    }
}
