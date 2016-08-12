import Foundation

func generateLabels() {
    func readStrings(path: String) -> [String: String] {
        guard let plist = NSDictionary(contentsOfFile: path) as? [String: String] else {
            preconditionFailure("Couldn't load countries from Simulator")
        }

        return plist
    }

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

    func appendVariants(name: String, variants: [String], to writer: Writer) {
        writer.append(line: "/// Automatically generated property for localized variants of \(name).")
        writer.append(line: "public static let \(name) = [")

        writer.beginIndent()
        for variant in variants {
            writer.append(line: "\"\(variant)\",")
        }
        writer.finishIndent()

        writer.append(line: "]")
        writer.append(line: "")
    }

    // uncomment to check available strings
    // print(readStrings(sdkPath + "/System/Library/Frameworks/CoreLocation.framework/English.lproj/locationd.strings"))

    let sdkPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk"
    let coreLocation = sdkPath + "/System/Library/Frameworks/CoreLocation.framework/"

    write("SystemAlertLabel") { (writer) in
        writer.append(line: "// swiftlint:disable variable_name")
        writer.append(line: "/// Represents possible label values on alert buttons.")
        writer.append(line: "public class SystemAlertLabel {")

        writer.beginIndent()
        writer.append(line: "private init() {}")
        writer.append(line: "")
        appendVariants("DontAllow", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "DONT_ALLOW"), to: writer)
        appendVariants("Allow", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "LOCATION_CLIENT_PERMISSION_OK"), to: writer)
        appendVariants("OK", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "OK"), to: writer)
        appendVariants("Cancel", variants: findVariants(coreLocation, fileName: "locationd.strings", key: "LOCATION_DISABLED_CANCEL"), to: writer)
        writer.finishIndent()

        writer.append(line: "}")
    }
}
