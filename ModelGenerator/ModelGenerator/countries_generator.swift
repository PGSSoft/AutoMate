import Foundation

func generateCountries() {
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

    write("SystemCountry") { (writer) in
        writer.append(line: "// swiftlint:disable type_body_length")
        writer.append(line: "")
        writer.append(line: "/// Enumeration describing available country codes in the system.")
        writer.append(line: "public enum SystemCountry: String {")

        writer.beginIndent()
        for (key, value) in countriesDictionary {
            let countryCodeRange = NSRange(location: 0, length: key.characters.count)
            guard countryCodeExpr.numberOfMatchesInString(key, options: [], range: countryCodeRange) > 0 else { continue }

            let range = NSRange(location: 0, length: value.characters.count)
            let caseName = expr.stringByReplacingMatchesInString(value, options: [], range: range, withTemplate: "")

            writer.append(line: "")
            writer.append(line: "/// Automatically generated value for country \(caseName).")
            writer.append(line: "case \(caseName) = \"\(key)\"")
        }
        writer.finishIndent()

        writer.append(line: "}")
    }
}
