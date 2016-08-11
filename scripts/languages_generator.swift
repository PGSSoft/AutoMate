#!/usr/bin/swift

// NOTE: Should be run directly from containing directory.

import Foundation

func scriptDirectory() -> String {
    let script = Process.arguments[0] as NSString
    assert(script.hasSuffix(".swift"), "Unable to find directory of the script.")
    return script.stringByDeletingLastPathComponent
}

extension NSMutableData {
    func append(line line: String, indent: Int) {
        var indented = ""
        for _ in 0..<indent {
            indented += "\t"
        }
        indented += line + "\n"

        guard let dataFromString = indented.dataUsingEncoding(NSUTF8StringEncoding) else {
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
data.append(line: "// swiftlint:disable type_body_length", indent: 0)
data.append(line: "\n/// Enumeration describing available languages in the system.", indent: 0)
data.append(line: "public enum SystemLanguage: String, LaunchArgumentValue {", indent: 0)

for identifier in languagesDictionary.keys {
    guard let displayName = locale.displayNameForKey(NSLocaleIdentifier, value: identifier) else {
        continue
    }
    let range = NSRange(location: 0, length: displayName.characters.count)
    var caseName = expr.stringByReplacingMatchesInString(displayName, options: [], range: range, withTemplate: "")
    data.append(line: "", indent: 0)
    data.append(line: "/// Automatically generated value for language \(caseName).", indent: 1)
    data.append(line: "case \(caseName) = \"\(identifier)\"", indent: 1)
}

data.append(line: "}", indent: 0)

let fileManager = NSFileManager()
let path = scriptDirectory() + "/../AutoMate/Models/SystemLanguage.swift"
let created = fileManager.createFileAtPath(path, contents: data, attributes: nil)

print("Created on path: \(path) - \(created)")
