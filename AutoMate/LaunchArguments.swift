//
//  LaunchArguments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 20/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

// MARK: - Language
/**
 Application language.
 More info: https://developer.apple.com/library/ios/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
 */
public struct LanguageArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleLanguages"

    // MARK: CollectionArgumetOption
    public let values: [LaunchArgumentValue]

    public init(_ values: [LaunchArgumentValue]) {
        self.values = values
    }
}

// MARK: - Locale
/**
 Application locale.
 More info: https://developer.apple.com/library/ios/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
 */
public protocol LocaleArgument: SingleArgumentOption { }

extension LocaleArgument {
    // MARK: ArgumetOption
    public var argumentKey: String {
        return "AppleLocale"
    }
}

public struct SystemLocaleArgument: SingleArgumentOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleLocale"

    // MARK: SingleArgumentOption
    public var value: LaunchArgumentValue
    public init(_ value: LaunchArgumentValue) {
        self.value = value
    }
}

// MARK: - Keyboard
/**
 Application keyboard.
 */
public struct KeyboardArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public let values: [LaunchArgumentValue]

    public init(_ values: [LaunchArgumentValue]) {
        self.values = values
    }
}

public struct SystemSoftwareKeyboardArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public var values: [LaunchArgumentValue]
    public init(_ values: [LaunchArgumentValue]) {
        self.values = values
    }
}

public struct SystemHardwareKeyboardArgument: CollectionArgumetOption {
    // MARK: ArgumetOption
    public typealias Value = HardwareKeyboards
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public var values: [LaunchArgumentValue]
    public init(_ values: [LaunchArgumentValue]) {
        self.values = values
    }
}
