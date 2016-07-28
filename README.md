<img src="assets/pgssoftware-logo.svg" alt="Made by PGS Software" height="200" />


# AutoMate

`AutoMate` is a Swift framework containing set of helpful `XCTest` extensions for writing UI automation tests. Provides strongly typed, extensible wrapper around launch arguments and environment variables, which can configure language, locale and keyboard type on the device.

[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/PGSSoft/AutoMate/blob/master/LICENSE)
<!-- List of other badges  -->

<!-- One screenshot -->
![Screenshot](assets/img.png)

## Installation

Preferred way to install it to use [Cocoapods](https://cocoapods.org/) with Podfile:

```ruby
pod 'AutoMate'
```

or use [Carthage](https://github.com/Carthage/Carthage) and add a line to `Cartfile.private`:

```
github PGSSoft/AutoMate
```

`Cartfile.private` should be used because AutoMate framework will be used by UI Tests target only not tested application.

## Usage

1. Create new UI test case class.
2. Import `AutoMate` framework to UI tests files:

    ```swift
    import AutoMate
    ```

3. In the `setup()` method use `TestLauncher` to configure application settings and launch the app:

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

If you want to provide your custom launch argument or launch environment you have to implement `LaunchOption` protocol or one of its extensions like `LaunchArgumentWithSingleValue`:

```swift
enum CustomParameter: String, LaunchArgumentWithSingleValue, LaunchArgumentValue {
    var argumentKey: String {
        return "AppParameter"
    }
    case value1
    case value2
}
```

Then you can pass it to the `TestBuilder`:

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
The project maintained by [software development agency](https://pgs-soft.com) [PGS Software](https://pgs-soft.com)
See our other [open-source projects](https://github.com/PGSSoft) or [contact us](https://www.pgs-soft.com/contact-us/) to grow your product.

[![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://github.com/PGSSoft/AutoMate)
[![Twitter Follow](https://img.shields.io/twitter/follow/pgssoftware.svg?style=social&label=Follow)](https://twitter.com/pgssoftware)
