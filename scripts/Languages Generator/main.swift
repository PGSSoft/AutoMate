#!/usr/bin/swift

import Foundation

extension NSMutableData {
    func appendString(string: String) {
        guard let dataFromString = string.dataUsingEncoding(NSUTF8StringEncoding) else {
            return
        }
        appendData(dataFromString)
    }
}

let locale = NSLocale(localeIdentifier: "en_US")
let regex = "\\W+"

guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

let simulatorLanguagesPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/IntlPreferences.framework/Language.strings"

guard let languagesDictionary = NSDictionary(contentsOfFile: simulatorLanguagesPath) as? [String: String] else {
    preconditionFailure("Couldn't load languages from Simulator")
}

var data = NSMutableData()
data.appendString("// swiftlint:disable:next type_body_length\n")
data.appendString("public enum SystemLanguages: String, LaunchArgumentValue {\n")

for identifier in languagesDictionary.keys {
    guard let displayName = locale.displayNameForKey(NSLocaleIdentifier, value: identifier) else {
        continue
    }
    let range = NSRange(location: 0, length: displayName.characters.count)
    var caseName = expr.stringByReplacingMatchesInString(displayName, options: [], range: range, withTemplate: "")
    data.appendString("\tcase \(caseName) = \"\(identifier)\"\n")
}

data.appendString("}\n")

let fileManager = NSFileManager()
let path = "../../AutoMate/Models/SystemLanguages.swift"
let created = fileManager.createFileAtPath(path, contents: data, attributes: nil)

print("Created on path: \(path) - \(created)")
