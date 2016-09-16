import Foundation

typealias KeyboardData = (name: String, software: String?, hardware: String?)
typealias NameAndValue = (String, String)

func getKeyboards() -> [KeyboardData] {
    var result = [KeyboardData]()

    let fileManager = FileManager()

    let enUSLocale = NSLocale(localeIdentifier: "en_US")

    let simulatorKeyboardsPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/TextInput/"

    guard let content = try? fileManager.contentsOfDirectory(atPath: simulatorKeyboardsPath) else {
        preconditionFailure("Couldn't find directory")
    }

    for bundleName in content where bundleName.contains(".bundle") {

        guard let bundle = Bundle(path: simulatorKeyboardsPath + bundleName),
            let infoPlist = bundle.infoDictionary,
            let inputModes = infoPlist["UIKeyboardSupportedInputModes"] as? [String: AnyObject] else {
                preconditionFailure("Couldn't initialize \(bundleName), find Info.plist or UIKeyboardSupportedInputModes entry.")
        }

        for (locale, localeInfo) in inputModes {
            guard let displayName = enUSLocale.displayName(forKey: .identifier, value: locale) else { continue }
            var item = KeyboardData(displayName, nil, nil)

            if let swLayouts = localeInfo["SWLayouts"] as? [String] {
                item.software = "\(locale)@sw=\(swLayouts.first!)"
            }

            if let hwLayouts = localeInfo["HWLayouts"] as? [String] {
                item.hardware = "\(locale)@hw=\(hwLayouts.first!)"
            }

            result.append(item)
        }
    }

    return result
}

func writeKeyboardEnum(to name: String, variant: String, cases: [NameAndValue]) {
    write(toFile: name) { (writer) in
        writer.append(line: "// swiftlint:disable type_body_length")
        writer.append(line: "")
        writer.append(line: "/// Enumeration describing available \(variant) keyboards in the system.")
        writer.append(line: "public enum \(name): String, LaunchArgumentValue {")

        writer.beginIndent()
        for (name, value) in cases {
            writer.append(line: "")
            let caseName = asIdentifier(name)
            writer.append(line: "/// Automatically generated value for \(variant) keyboard \(caseName).")
            writer.append(line: "case \(caseName) = \"\(value)\"")
        }
        writer.finishIndent()

        writer.append(line: "}")
    }
}

func generateKeyboards() {
    let keyboards = getKeyboards()
    var softwareKeyboards = [NameAndValue]()
    var hardwareKeyboards = [NameAndValue]()
    for item in keyboards {
        if let software = item.software {
            softwareKeyboards.append((item.name, software))
        }
        if let hardware = item.hardware {
            hardwareKeyboards.append((item.name, hardware))
        }
    }

    writeKeyboardEnum(to: "HardwareKeyboard", variant: "hardware", cases: hardwareKeyboards)
    writeKeyboardEnum(to: "SoftwareKeyboard", variant: "software", cases: softwareKeyboards)
}
