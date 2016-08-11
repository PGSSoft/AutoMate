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

let enUSLocale = NSLocale(localeIdentifier: "en_US")
let regex = "\\W+"
guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

var softwareKeyboardsData = NSMutableData()
softwareKeyboardsData.append(line: "// swiftlint:disable type_body_length", indent: 0)
softwareKeyboardsData.append(line: "\n/// Enumeration describing available software keyboards in the system.", indent: 0)
softwareKeyboardsData.append(line: "public enum SoftwareKeyboard: String, LaunchArgumentValue {", indent: 0)

var hardwareKeyboardsData = NSMutableData()
hardwareKeyboardsData.append(line: "// swiftlint:disable type_body_length", indent: 0)
hardwareKeyboardsData.append(line: "\n/// Enumeration describing available hardware keyboards in the system.", indent: 0)
hardwareKeyboardsData.append(line: "public enum HardwareKeyboard: String, LaunchArgumentValue {", indent: 0)

let fileManager = NSFileManager()

let simulatorKeyboardsPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/TextInput/"

guard let content = try? fileManager.contentsOfDirectoryAtPath(simulatorKeyboardsPath) else {
    preconditionFailure("Couldn't find directory")
}

for bundleName in content where bundleName.containsString(".bundle") {

    guard let bundle = NSBundle(path: simulatorKeyboardsPath + bundleName),
        infoPlist = bundle.infoDictionary,
        inputModes = infoPlist["UIKeyboardSupportedInputModes"] as? [String: AnyObject] else {
            preconditionFailure("Couldn't initialize \(bundleName), find Info.plist or UIKeyboardSupportedInputModes entry.")
    }

    for (locale, localeInfo) in inputModes {
        guard let displayName = enUSLocale.displayNameForKey(NSLocaleIdentifier, value: locale) else { continue }

        let range = NSRange(location: 0, length: displayName.characters.count)
        var caseName = expr.stringByReplacingMatchesInString(displayName, options: [], range: range, withTemplate: "")

        if let swLayouts = localeInfo["SWLayouts"] as? [String] {
            softwareKeyboardsData.append(line: "", indent: 0)
            softwareKeyboardsData.append(line: "/// Automatically generated value for software keyboard \(caseName).", indent: 1)
            softwareKeyboardsData.append(line: "case \(caseName) = \"\(locale)@sw=\(swLayouts.first!)\"", indent: 1)
        }

        if let hwLayouts = localeInfo["HWLayouts"] as? [String] {
            hardwareKeyboardsData.append(line: "", indent: 0)
            hardwareKeyboardsData.append(line: "/// Automatically generated value for hardware keyboard \(caseName).", indent: 1)
            hardwareKeyboardsData.append(line: "case \(caseName) = \"\(locale)@hw=\(hwLayouts.first!)\"", indent: 1)
        }
    }
}

softwareKeyboardsData.append(line: "}", indent: 0)
hardwareKeyboardsData.append(line: "}", indent: 0)

let swPath = scriptDirectory() + "/../AutoMate/Models/SoftwareKeyboard.swift"
let hwPath = scriptDirectory() + "/../AutoMate/Models/HardwareKeyboard.swift"
let swCreated = fileManager.createFileAtPath(swPath, contents: softwareKeyboardsData, attributes: nil)
let hwCreated = fileManager.createFileAtPath(hwPath, contents: hardwareKeyboardsData, attributes: nil)

print("Software keyboards created: \(swCreated) Hardware keyboards created: \(hwCreated)")
