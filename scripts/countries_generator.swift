#!/usr/bin/swift

// NOTE: Should be run directly from containing directory.

import Foundation

func scriptDirectory() -> String {
    let script = Process.arguments[0] as NSString
    assert(script.hasSuffix(".swift"), "Unable to find directory of the script.")
    return script.stringByDeletingLastPathComponent
}

extension NSMutableData {
    func appendString(string: String) {
        guard let dataFromString = string.dataUsingEncoding(NSUTF8StringEncoding) else {
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
data.appendString("// swiftlint:disable type_body_length\n")
data.appendString("\n///Enumeration describing available country codes in the system.\n")
data.appendString("public enum SystemCountry: String {\n")

for (key, value) in countriesDictionary {
    let countryCodeRange = NSRange(location: 0, length: key.characters.count)
    guard countryCodeExpr.numberOfMatchesInString(key, options: [], range: countryCodeRange) > 0 else { continue }
    let range = NSRange(location: 0, length: value.characters.count)
    var caseName = expr.stringByReplacingMatchesInString(value, options: [], range: range, withTemplate: "")
    data.appendString("\n\t///Automatically generated value for country \(caseName).\n")
    data.appendString("\tcase \(caseName) = \"\(key)\"\n")
}

data.appendString("}\n")

let fileManager = NSFileManager()
let path = scriptDirectory() + "/../AutoMate/Models/SystemCountry.swift"
let created = fileManager.createFileAtPath(path, contents: data, attributes: nil)

print("Created on path: \(path) - \(created)")
