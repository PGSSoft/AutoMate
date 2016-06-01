import AutoMate

enum ApplicationLanguage: String, LaunchArgumentValue {
    case English = "en"
    case German = "de-De"
}

enum ApplicationLocales: String, LocaleArgument, LaunchArgumentValue {
    case UnitedStates = "en_US"
}

var languages: LanguageArgument = [ApplicationLanguage.English, ApplicationLanguage.German]

TestLauncher(options: [languages])
// TestLauncher(options: [languages, ApplicationLocales.UnitedStates])
// Commented out form should work but there is some issue on Playground with:
// public var value: LaunchArgumentValue { return self }
