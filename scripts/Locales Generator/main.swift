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

let identifiers = NSLocale.availableLocaleIdentifiers()
let locale = NSLocale(localeIdentifier: "en_US")
let regex = "\\W+"

guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

var data = NSMutableData()
data.appendString("// swiftlint:disable:next type_body_length\n")
data.appendString("public enum SystemLocales: String, Locale {\n")

for identifier in identifiers {
    guard let displayName = locale.displayNameForKey(NSLocaleIdentifier, value: identifier) else {
        continue
    }
    let range = NSRange(location: 0, length: displayName.characters.count)
    var caseName = expr.stringByReplacingMatchesInString(displayName, options: [], range: range, withTemplate: "")
    data.appendString("\tcase \(caseName) = \"\(identifier)\"\n")
}

data.appendString("}\n")

let fileManager = NSFileManager()
let path = "../../AutoMate/Models/SystemLocales.swift"
let created = fileManager.createFileAtPath(path, contents: data, attributes: nil)

print("Created on path: \(path) - \(created)")
