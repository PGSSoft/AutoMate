import AutoMate

enum ApplicationLanguage: String, Language {
    case English = "en"
    case German = "de-De"
}

enum ApplicationLocales: String, Locale {
    case UnitedStates = "en-US"
}

var languages: LanguageArgument<ApplicationLanguage> = [.English, .German]
var locale: LocaleArgument<ApplicationLocales> = LocaleArgument(.UnitedStates)

TestLauncher(options: [languages, locale])
