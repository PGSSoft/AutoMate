<!-- <img src="assets/pgssoftware-logo.svg" alt="Made by PGS Software" height="200" /> -->


# AutoMate

`AutoMate` is a Swift framework containing a set of helpful `XCTest` extensions for writing UI automation tests. It provides strongly typed, extensible wrapper around launch arguments and environment variables, which can be used for language, locale and keyboard type configuration on the device.

[![Swift 2.2.1](https://img.shields.io/badge/Swift-2.2.1-orange.svg?style=flat)](https://swift.org/)
[![Travis](https://img.shields.io/travis/PGSSoft/AutoMate.svg)](https://travis-ci.org/PGSSoft/AutoMate/)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/AutoMate.svg)](https://cocoapods.org/pods/AutoMate)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/AutoMate.svg)](http://cocoadocs.org/docsets/AutoMate)
[![License](https://img.shields.io/cocoapods/l/AutoMate.svg)](https://github.com/PGSSoft/AutoMate)

<!-- ![Screenshot](assets/img.png) -->

## Installation

The most convenient way to install it is by using [Cocoapods](https://cocoapods.org/) with Podfile:

```ruby
pod 'AutoMate'
```

or using [Carthage](https://github.com/Carthage/Carthage) and add a line to `Cartfile.private`:

```
github "PGSSoft/AutoMate"
```

`Cartfile.private` should be used because AutoMate framework will be used by UI Tests target only not by the tested application.

## Usage

1. Create a new UI test case class.
2. Import `AutoMate` framework to UI tests files:

    ```swift
    import AutoMate
    ```

3. Use `TestLauncher` in the `setup()` method to configure application settings and launch the application:

    ```swift
    let app = XCUIApplication()
    TestLauncher(options: [
        SystemLanguages([.English, .German]),
        SystemLocale(language: .English, country: .Canada),
        SoftwareKeyboards([.EnglishCanada, .GermanGermany])
    ]).configure(app).launch()
    ```

## Features (or ToDo)

- [x] Set keyboards
- [x] Set locale
- [x] Set languages
- [x] Custom arguments
- [x] Custom keyboards, locales and languages
- [ ] `XCTest` extensions
- [ ] Added CoreData launch arguments
- [ ] Disable UIView animations

## Development

If you want to provide your custom launch argument or launch environment you have to implement `LaunchOption` protocol or one of its extensions, such as `LaunchArgumentWithSingleValue`:

```swift
enum CustomParameter: String, LaunchArgumentWithSingleValue, LaunchArgumentValue {
    var argumentKey: String {
        return "AppParameter"
    }
    case value1
    case value2
}
```

Then, you can pass it to the `TestBuilder`:

```swift
let launcher = TestLauncher(options: [
    CustomParameter.value1
])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/PGSSoft/AutoMate](https://github.com/PGSSoft/AutoMate).

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## About
The project maintained by [software development agency](https://www.pgs-soft.com/) [PGS Software](https://www.pgs-soft.com/).
See our other [open-source projects](https://github.com/PGSSoft) or [contact us](https://www.pgs-soft.com/contact-us/) to develop your product.

## Follow us

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=https://github.com/PGSSoft/AutoMate)  
[![Twitter Follow](https://img.shields.io/twitter/follow/pgssoftware.svg?style=social&label=Follow)](https://twitter.com/pgssoftware)
