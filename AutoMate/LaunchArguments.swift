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
public protocol LanguageArgument: LaunchArgumentOption { }

extension LanguageArgument {
    // MARK: ArgumetOption
    public var argumentKey: String {
        return "AppleLanguages"
    }
}

// MARK: - Locale
/**
 Application locale.
 More info: https://developer.apple.com/library/ios/documentation/MacOSX/Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html
 */
public protocol LocaleArgument: LaunchArgumentOption { }

extension LocaleArgument {
    // MARK: ArgumetOption
    public var argumentKey: String {
        return "AppleLocale"
    }
}

// MARK: - Keyboard
/**
 Application keyboard.
 */
public protocol KeyboardArgument: LaunchArgumentOption { }

extension KeyboardArgument {
    // MARK: ArgumetOption
    public var argumentKey: String {
        return "AppleKeyboards"
    }
}
