# Custom launch arguments

Custom launch argument can be created by implementing `LaunchOption` protocol, on new or existing type.

```swift
struct CustomOption: LaunchOption {
    var launchArguments: [String]? {
        return ["-MyArgument", "MyValue"]
    }
}
```

They can be passed to the `TestLauncher` to configure the application before launch.
Use `TestLauncher` in the `setUp()` method to configure application settings and launch the application:

```swift
let app = XCUIApplication()
TestLauncher(options: [
    CustomOption()
]).configure(app).launch()
```

For common cases, `AutoMate` provides helper protocols.

- `LaunchArgument` - provides `key` variable, like `SkipLogin`, which will produce: `-SkipLogin` argument
- `LaunchArgumentWithSingleValue` - arguments with single value, like `-Argument 1`
- `LaunchArgumentWithMultipleValues` - arguments with multiple values, like `-Argument ("1", "2")`

`XCUIApplication` requires fitting launch argument data as strings. The `LaunchArgumentValue` protocol provides
an abstraction around argument values. It provides default implementation for `RawRepresentable` objects
and `Bool` values (check `BooleanLaunchArgumentValue`).

These protocols simplify implementation of new launch arguments by providing default implementations. For example, enumeration values with raw type would be handled automatically.

```swift
enum Server: String, LaunchArgumentWithSingleValue, LaunchArgumentValue {
    case testing, production

    var key: String {
        return "Server"
    }
}

struct SkipLogin: LaunchArgumentWithSingleValue {
    var value: LaunchArgumentValue { return skip }
    let skip: BooleanLaunchArgumentValue
    let key = "SkipLogin"
}
```

Multiple values of launch option would be formatted according to Apple's convention i.e. `-MagicNumbers (1, 2)`:

```swift
struct MagicNumbers: LaunchArgumentWithMultipleValues {
    struct Number: LaunchArgumentValue {
        var value: String {
            return "\(number)"
        }
        let number: Int
    }

    let key = "MagicNumbers"
    let values: [Number]
    public init(_ values: [Number]) {
        self.values = values
    }
}
```

Custom arguments can then be used as follows:

```swift
let app = XCUIApplication()
TestLauncher(options: [
    Server.testing,
    SkipLogin(skip: true),
    MagicNumbers([.init(number: 5), .init(number: 7)])
]).configure(app).launch()
```

## Handling

All launch arguments are handled by the system as user defaults. In the application `UserDefaults` class
can be used to get provided arguments data.

```swift
let serverAddress = UserDefaults.standard.string(forKey: "Server")
let skipLogin = UserDefaults.standard.bool(forKey: "SkipLogin")
let magicNumbers = UserDefaults.standard.stringArray(forKey: "MagicNumbers")
```

