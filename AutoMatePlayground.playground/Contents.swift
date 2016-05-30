@testable import AutoMate

public enum ApplicationLocale: String, LaunchArgumentValue {

    case German = "de_DE"
    case US = "en_US"
}

extension ApplicationLocale: ArgumentOption {
    public var argumentKey: String {
        return "AppleLocale"
    }

    public var launchArguments: [String]? {
        return ["-\(argumentKey)", launchArgument]
    }
}

let launcher = TestLauncher(options: [ApplicationLocale.US])
launcher.buildLaunchArguments()
