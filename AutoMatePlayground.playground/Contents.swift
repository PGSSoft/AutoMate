@testable import AutoMate

var softwareKeyboards: SystemSoftwareKeyboardArgument = [.EnglishUnitedStates, .RussianRussia]
var hardwareKeyboards: SystemHardwareKeyboardArgument = [.EnglishUnitedStates, .RussianRussia]

var keyboards = SystemKeyboardArgument(software: softwareKeyboards, hardware: hardwareKeyboards)
keyboards.launchArguments

var languages: SystemLanguageArgument = [.EnglishUnitedStates, .Romanian]

let locale = SystemLocaleArgument(language: .English, country: .GreatBritain)

let launcher = TestLauncher(options: [softwareKeyboards, languages, locale])
launcher.buildLaunchArguments()
