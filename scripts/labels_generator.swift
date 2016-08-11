#!/usr/bin/swift

import Foundation

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

func readStrings(path: String) -> [String: String] {
    guard let plist = NSDictionary(contentsOfFile: path) as? [String: String] else {
        preconditionFailure("Couldn't load countries from Simulator")
    }

    return plist
}

func scriptDirectory() -> String {
    #if DEBUG
        return "/Users/pszot/Documents/Projekty/pgs-automate-ios/scripts/"
    #else
        let script = Process.arguments[0] as NSString
        assert(script.hasSuffix(".swift"), "Unable to find directory of the script.")
        return script.stringByDeletingLastPathComponent
    #endif
}

let sdkPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"
//let modelsPath = scriptDirectory() + "../AutoMate/Models/"

func findVariants(directory: String, fileName: String, key: String) -> [String] {
    guard let enumerator = NSFileManager().enumeratorAtPath(directory) else {
        fatalError("Failed to enumerate directory.")
    }
    let variants: [String] = enumerator.flatMap { obj in
        guard let path = obj as? String else {
            fatalError()
        }
        if path.hasSuffix(fileName) {
            let absolute = directory + path
            return readStrings(absolute)[key]!
        } else {
            return nil
        }
    }

    return Array(Set(variants)) // remove duplicates
}

func appendVariants(name: String, variants: [String], to data: NSMutableData) {
    data.append(line: "/// Automatically generated property for localized variants of \(name).", indent: 1)
    data.append(line: "public static let \(name) = [", indent: 1)
    for variant in variants {
        data.append(line: "\"\(variant)\",", indent: 2)
    }
    data.append(line: "]", indent: 1)
    data.append(line: "", indent: 0)
}

//uncomment to check available strings
//print(readStrings(sdkPath + "/System/Library/Frameworks/CoreLocation.framework/English.lproj/locationd.strings"))

let coreLocation = sdkPath + "/System/Library/Frameworks/CoreLocation.framework/"

var data = NSMutableData()
data.append(line: "// swiftlint:disable variable_name", indent: 0)
data.append(line: "/// Represents possible label values on alert buttons.", indent: 0)
data.append(line: "public class SystemAlertLabel {", indent: 0)
data.append(line: "private init() {}", indent: 1)
data.append(line: "", indent: 0)
appendVariants("DontAllow", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "DONT_ALLOW"), to: data)
appendVariants("Allow", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "LOCATION_CLIENT_PERMISSION_OK"), to: data)
appendVariants("OK", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "OK"), to: data)
appendVariants("Cancel", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "LOCATION_DISABLED_CANCEL"), to: data)
data.append(line: "}", indent: 0)
do {
    try data.writeToFile(scriptDirectory() + "/../AutoMate/Models/SystemAlertLabel.swift", options: [])
} catch {
    fatalError("Failed to save file.")
}

print("done")
