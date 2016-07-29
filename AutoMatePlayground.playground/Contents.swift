@testable import AutoMate

var softwareKeyboards: SoftwareKeyboards = [.EnglishUnitedStates, .RussianRussia]
var hardwareKeyboards: HardwareKeyboards = [.EnglishUnitedStates, .RussianRussia]

var keyboards = SystemKeyboards(software: softwareKeyboards, hardware: hardwareKeyboards)
keyboards.launchArguments

var languages: SystemLanguages = [.EnglishUnitedStates, .Romanian]

let locale = SystemLocale(language: .English, country: .GreatBritain)

let launcher = TestLauncher(options: [softwareKeyboards, languages, locale])
launcher.launchArguments
