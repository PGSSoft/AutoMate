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

let countryCodeRegex = "[A-Z]+"
guard let countryCodeExpr = try? NSRegularExpression(pattern: countryCodeRegex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

let regex = "\\W+"
guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

let simulatorCountriesPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/AppSupport.framework/English.lproj/Localizable_Countries.strings"

guard let countriesDictionary = NSDictionary(contentsOfFile: simulatorCountriesPath) as? [String: String] else {
    preconditionFailure("Couldn't load countries from Simulator")
}
countriesDictionary

var data = NSMutableData()
data.append(line: "// swiftlint:disable type_body_length", indent: 0)
data.append(line: "\n/// Enumeration describing available country codes in the system.", indent: 0)
data.append(line: "public enum SystemCountry: String {", indent: 0)

for (key, value) in countriesDictionary {
    let countryCodeRange = NSRange(location: 0, length: key.characters.count)
    guard countryCodeExpr.numberOfMatchesInString(key, options: [], range: countryCodeRange) > 0 else { continue }
    let range = NSRange(location: 0, length: value.characters.count)
    var caseName = expr.stringByReplacingMatchesInString(value, options: [], range: range, withTemplate: "")
    data.append(line: "", indent: 0)
    data.append(line: "/// Automatically generated value for country \(caseName).", indent: 1)
    data.append(line: "case \(caseName) = \"\(key)\"", indent: 1)
}

data.append(line: "}", indent: 0)

let fileManager = NSFileManager()
let path = scriptDirectory() + "/../AutoMate/Models/SystemCountry.swift"
let created = fileManager.createFileAtPath(path, contents: data, attributes: nil)

print("Created on path: \(path) - \(created)")
