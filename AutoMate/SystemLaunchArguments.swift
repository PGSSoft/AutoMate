//
//  SystemLaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation

public struct SystemLanguageArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleLanguages"

    // MARK: CollectionArgumetOption
    public let values: [SystemLanguages]

    public init(_ values: [SystemLanguages]) {
        self.values = values
    }
}

public struct SystemLocaleArgument: LocaleArgument, LaunchArgumentValue {

    private let localeIdentifier: String
    public var launchArgument: String {
        return "\"\(localeIdentifier)\""
    }

    public init(localeIdentifier: String) {
        self.localeIdentifier = localeIdentifier
    }

    public init(language: SystemLanguages, country: SystemCountries) {
        self.localeIdentifier = "\(language.rawValue)_\(country.rawValue)"
    }
}

public struct SystemSoftwareKeyboardArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public var values: [SoftwareKeyboards]

    public init(_ values: [SoftwareKeyboards]) {
        self.values = values
    }
}

public struct SystemHardwareKeyboardArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public var values: [HardwareKeyboards]

    public init(_ values: [HardwareKeyboards]) {
        self.values = values
    }
}
