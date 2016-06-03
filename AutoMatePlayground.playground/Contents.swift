import AutoMate

var softwareKeyboards: SystemSoftwareKeyboardArgument = [.EnglishUnitedStates, .RussianRussia]
var hardwareKeyboards: SystemHardwareKeyboardArgument = [.EnglishUnitedStates, .RussianRussia]

var keyboards = SystemKeyboardArgument(software: softwareKeyboards, hardware: hardwareKeyboards)
keyboards.launchArguments

var languages: SystemLanguageArgument = [.EnglishUnitedStates, .Romanian]

//let locale = SystemLocaleArgument(language: .English, country: .GreatBritain)
TestLauncher(options: [keyboards, languages])

// TestLauncher(options: [softwareKeyboards, languages, locale])
// Commented out form should work but there is some issue on Playground with:
// public var value: LaunchArgumentValue { return self }
