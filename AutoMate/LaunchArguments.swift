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
 More info: https://developer.apple.com/library/ios/documentation/MacOSX/
 Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html

 - German: German language: de-DE
 */
public protocol Language: RawRepresentable, LaunchArgumentValue {
}

public struct LanguageArgument<T: Language>: CollectionArgumetOption {
    // MARK: ArgumetOption
    public typealias Value = T
    public let argumentKey: String = "AppleLanguages"

    // MARK: CollectionArgumetOption
    public let values: [T]

    public init(_ values: [T]) {
        self.values = values
    }
}

// MARK: ArrayLiteralConvertible
extension LanguageArgument {
    public init(arrayLiteral elements: T ...) {
        values = elements
    }
}

// MARK: - Locale
/**
 Application locale.
 More info: https://developer.apple.com/library/ios/documentation/MacOSX/
 Conceptual/BPInternational/LanguageandLocaleIDs/LanguageandLocaleIDs.html

 - German: German locale: de_DE
 */

public protocol Locale: RawRepresentable, LaunchArgumentValue {
}

public struct LocaleArgument <T: Locale>: SingleArgumentOption {
    // MARK: ArgumetOption
    public typealias Value = T
    public let argumentKey: String = "AppleLocale"

    // MARK: SingleArgumentOption
    public let value: T

    public init(_ value: T) {
        self.value = value
    }
}

// MARK: - Keyboard
/**
 Application keyboard.

 - German: German keyboard: de_DE@sw=QWERTZ-German
 - US:     US keyboard: en_US@hw=US;sw=QWERTY
 - Emoji:  Emoji keyboard: emoji@sw=Emoji
 */
public protocol Keyboard: RawRepresentable, LaunchArgumentValue {
}

public struct KeyboardArgument<T: Keyboard>: CollectionArgumetOption {
    // MARK: ArgumetOption
    public typealias Value = T
    public let argumentKey: String = "AppleKeyboards"

    // MARK: CollectionArgumetOption
    public let values: [T]

    public init(_ values: [Value]) {
        self.values = values
    }
}

// MARK: ArrayLiteralConvertible
extension KeyboardArgument {
    public init(arrayLiteral elements: T ...) {
        values = elements
    }
}
