import Foundation

func generateLanguages() {
    let locale = NSLocale(localeIdentifier: "en_US")
    let regex = "\\W+"

    guard let expr = try? NSRegularExpression(pattern: regex, options: []) else {
        preconditionFailure("Couldn't initialize expression with given pattern")
    }

    let simulatorLanguagesPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/System/Library/PrivateFrameworks/IntlPreferences.framework/Language.strings"

    guard let languagesDictionary = NSDictionary(contentsOfFile: simulatorLanguagesPath) as? [String: String] else {
        preconditionFailure("Couldn't load languages from Simulator")
    }

    write("SystemLanguage") { (writer) in
        writer.append(line: "// swiftlint:disable type_body_length")
        writer.append(line: "")
        writer.append(line: "/// Enumeration describing available languages in the system.")
        writer.append(line: "public enum SystemLanguage: String, LaunchArgumentValue {")

        writer.beginIndent()
        for identifier in languagesDictionary.keys {
            guard let displayName = locale.displayNameForKey(NSLocaleIdentifier, value: identifier) else {
                continue
            }
            let range = NSRange(location: 0, length: displayName.characters.count)
            let caseName = expr.stringByReplacingMatchesInString(displayName, options: [], range: range, withTemplate: "")
            writer.append(line: "")
            writer.append(line: "/// Automatically generated value for language \(caseName).")
            writer.append(line: "case \(caseName) = \"\(identifier)\"")
        }
        writer.finishIndent()

        writer.append(line: "}")
    }

}
