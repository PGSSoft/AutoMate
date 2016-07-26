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

let enUSLocale = NSLocale(localeIdentifier: "en_US")
let regex = "\\W+"
guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
    preconditionFailure("Couldn't initialize expression with given pattern")
}

var softwareKeyboardsData = NSMutableData()
softwareKeyboardsData.appendString("// swiftlint:disable:next type_body_length\n")
softwareKeyboardsData.appendString("public enum SoftwareKeyboards: String, LaunchArgumentValue {\n")

var hardwareKeyboardsData = NSMutableData()
hardwareKeyboardsData.appendString("// swiftlint:disable:next type_body_length\n")
hardwareKeyboardsData.appendString("public enum HardwareKeyboards: String, LaunchArgumentValue {\n")

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
            softwareKeyboardsData.appendString("\tcase \(caseName) = \"\(locale)@sw=\(swLayouts.first!)\"\n")
        }

        if let hwLayouts = localeInfo["HWLayouts"] as? [String] {
            hardwareKeyboardsData.appendString("\tcase \(caseName) = \"\(locale)@hw=\(hwLayouts.first!)\"\n")
        }
    }
}

softwareKeyboardsData.appendString("}\n")
hardwareKeyboardsData.appendString("}\n")

let swPath = scriptDirectory()+"/../../AutoMate/Models/SoftwareKeyboards.swift"
let hwPath = scriptDirectory()+"/../../AutoMate/Models/HardwareKeyboards.swift"
let swCreated = fileManager.createFileAtPath(swPath, contents: softwareKeyboardsData, attributes: nil)
let hwCreated = fileManager.createFileAtPath(hwPath, contents: hardwareKeyboardsData, attributes: nil)

print("Software keyboards created: \(swCreated) Hardware keyboards created: \(hwCreated)")
