import AutoMate

var softwareKeyboards: SystemSoftwareKeyboardArgument = [.EnglishUnitedStates, .RussianRussia]
var languages: SystemLanguageArgument = [.EnglishUnitedStates, .Romanian]

//let locale = SystemLocaleArgument(language: .English, country: .GreatBritain)
TestLauncher(options: [softwareKeyboards, languages])

// TestLauncher(options: [softwareKeyboards, languages, locale])
// Commented out form should work but there is some issue on Playground with:
// public var value: LaunchArgumentValue { return self }
