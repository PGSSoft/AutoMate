import Foundation

func generateLabels() {
    func readStrings(fromPath path: String) -> [String: String] {
        guard let plist = NSDictionary(contentsOfFile: path) as? [String: String] else {
            preconditionFailure("Couldn't load countries from Simulator")
        }

        return plist
    }

    func findVariants(inDirectory directory: String, fileName: String, key: String) -> [String] {
        guard let enumerator = FileManager().enumerator(atPath: directory) else {
            fatalError("Failed to enumerate directory.")
        }
        let variants: [String] = enumerator.flatMap { obj in
            guard let path = obj as? String else {
                fatalError()
            }
            if path.hasSuffix(fileName) {
                let absolute = directory + path
                return readStrings(fromPath: absolute)[key]!
            } else {
                return nil
            }
        }

        return Array(Set(variants)) // remove duplicates
    }

    func appendVariants(name: String, variants: [String], to writer: Writer) {
        writer.append(line: "/// Automatically generated property for localized variants of \(name).")
        writer.append(line: "open static let \(name) = [")

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

    write(toFile: "SystemAlertLabel") { (writer) in
        writer.append(line: "// swiftlint:disable variable_name")
        writer.append(line: "/// Represents possible label values on alert buttons.")
        writer.append(line: "open class SystemAlertLabel {")

        writer.beginIndent()
        writer.append(line: "private init() {}")
        writer.append(line: "")
        appendVariants(name: "dontAllow", variants: findVariants(inDirectory: coreLocation, fileName: "locationd.strings", key: "DONT_ALLOW"), to: writer)
        appendVariants(name: "allow", variants: findVariants(inDirectory: coreLocation, fileName: "locationd.strings", key: "LOCATION_CLIENT_PERMISSION_OK"), to: writer)
        appendVariants(name: "ok", variants: findVariants(inDirectory: coreLocation, fileName: "locationd.strings", key: "OK"), to: writer)
        appendVariants(name: "cancel", variants: findVariants(inDirectory: coreLocation, fileName: "locationd.strings", key: "LOCATION_DISABLED_CANCEL"), to: writer)
        writer.finishIndent()

        writer.append(line: "}")
    }
}
