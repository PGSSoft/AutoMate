//
//  SystemLaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

public struct SystemLanguageArgument: LanguageArgument {

    // MARK: CollectionArgumetOption
    public let values: [SystemLanguages]

    public init(_ values: [SystemLanguages]) {
        self.values = values
    }
}

public struct SystemLocaleArgument: LocaleArgument {

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

public struct SystemSoftwareKeyboardArgument: KeyboardArgument {

    // MARK: CollectionArgumetOption
    public var values: [SoftwareKeyboards]

    public init(_ values: [SoftwareKeyboards]) {
        self.values = values
    }
}

public struct SystemHardwareKeyboardArgument: KeyboardArgument {

    // MARK: CollectionArgumetOption
    public var values: [HardwareKeyboards]

    public init(_ values: [HardwareKeyboards]) {
        self.values = values
    }
}
