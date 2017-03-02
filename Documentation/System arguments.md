# System launch arguments

- [Usage](#usage)
- [Predefined arguments](#predefined-arguments)
    - [System languages](#systeml-anguages)
    - [System locale](#system-locale)
    - [System keyboards](#system-keyboards)
    - [Core Data options](#core-data-options)
    - [Localised strings options](#localised-strings-options)

## Usage

`AutoMate` contains set of predefined launch arguments. They can be passed to the `TestLauncher`
to configure the application before launch.

Use `TestLauncher` in the `setUp()` method to configure application settings and launch the application:

```swift
let app = XCUIApplication()
TestLauncher(options: [
    SystemLanguages([.English, .German])
]).configure(app).launch()
```

## Predefined arguments

`AutoMate` has predefined launch argument types for most common system launch arguments.
Below are shown examples of each of them, with corresponding generated strings that
would be set on the `XCUIApplication` instance.

### System languages

`SystemLanguages` allows to replace order of preferred languages which will be used
by the application do display localized content.

Swift expression

```swift
SystemLanguages([.English, .Polish])
// or
[.English, .Polish] as SystemLanguages
```

Generated strings

```swift
-AppleLanguages ("en", "pl")
```

### System locale

`SystemLocale` allows to replace users locale.

Swift expression

```swift
SystemLocale(localeIdentifier: "pl")
SystemLocale(language: .Polish, country: .Poland)
```

Generated strings

```swift
-AppleLocale "pl"
-AppleLocale "pl_PL"
```

### System keyboards

`SoftwareKeyboards` and `HardwareKeyboards` allows to set keyboards used in the application.
It is possible to provide only software keyboards, or only hardware keyboards.

Swift expression

```swift
[.Bengali] as SoftwareKeyboards
[.Bengali] as HardwareKeyboards
```

Generated strings

```swift
-AppleKeyboards ("bn@sw=Bengali")
-AppleKeyboards ("bn@hw=Bangla")
```

Keyboards can be also joined together by using `SystemKeyboards`:

```swift
var softwareKeyboards: SoftwareKeyboards = [.Bengali]
var hardwareKeyboards: HardwareKeyboards = [.Bengali]

SystemKeyboards(software: softwareKeyboards, hardware: hardwareKeyboards)
```

Generated strings

```swift
-AppleKeyboards ("bn@sw=Bengali", "bn@hw=Bangla")
```

### Core Data options

`CoreDataOption` allows to enable debug options for CoreData.

```swift
// -com.apple.CoreData.SQLDebug "1"
CoreDataOption.sqlDebug(verbosityLevel: .low)

// -com.apple.CoreData.SQLiteDebugSynchronous "1"
CoreDataOption.sqLiteDebugSynchronous(syncing: .disabled)

// -com.apple.CoreData.SyntaxColoredLogging "1"
CoreDataOption.syntaxColoredLogging

// -com.apple.CoreData.MigrationDebug "1"
CoreDataOption.migrationDebug

// -com.apple.CoreData.ConcurrencyDebug "1"
CoreDataOption.concurrencyDebug

// -com.apple.CoreData.SQLiteIntegrityCheck "1"
CoreDataOption.sqLiteIntegrityCheck

// -com.apple.CoreData.ThreadingDebug "1"
CoreDataOption.threadingDebug(verbosityLevel: .low)
```

Usage:

```swift
let app = XCUIApplication()
TestLauncher(options: [
    CoreDataOption.sqlDebug(verbosityLevel: .high)
]).configure(app).launch()
```

### Localised strings options

`LocalizedStrings` allows to set options to debug localized strings.

```swift
// -NSShowNonLocalizedStrings "1"
LocalizedStrings.showNonLocalizedStrings

// -NSDoubleLocalizedStrings "1"
LocalizedStrings.doubleLocalizedStrings
```
