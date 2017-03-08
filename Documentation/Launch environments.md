# Launch environments

Launch environment is next method of providing data to the application next to the launch arguments.
Custom launch environment can be created by implementing `LaunchOption` protocol, on new or existing type.

```swift
struct CustomOption: LaunchOption {
    var launchEnvironments: [String: String]? {
        return ["CustomVariable": "1"]
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

- `LaunchEnvironmentProtocol` - provides minimal requirements (the `LaunchEnvironmentValue` type) which represents passes data
- `LaunchEnvironmentWithSingleValue` - adds `key` variable
- `LaunchEnvironmentWithMultipleValues` - give possibility to pass multiple data separated by comma

`XCUIApplication` requires launch environment as dictionary: `[String: String]`.
The `LaunchEnvironmentValue` provides definition and default implementation for value types,
for example `BooleanLaunchEnvironmentValue`.

Above protocols support with the implementation of new launch environments by providing default implementation.
For example, launch environment with key and value could be implemented like this:

```swift
public struct SimpleLaunchEnvironment: LaunchEnvironmentWithSingleValue {

    public typealias Value = String
    public let key = "LAUNCH_KEY"
    public var value: String
}

let simpe = SimpleLaunchEnvironment(value: "LaunchValue")
```

`LaunchEnvironmentWithMultipleValues` can be implemented like:

```swift
public struct ArrayLaunchEnvironment: LaunchEnvironmentWithMultipleValues {

    public typealias Value = String
    public let valuesCollection: [String]

    public init(valuesCollection: [Value]) {
        self.valuesCollection = valuesCollection
    }
}

let array = ["Value1", "Value2"] as ArrayLaunchEnvironment
```

In addition, types `LaunchEnvironment` and `LaunchEnvironments` can be used directly instead of creating custom types:

```swift
let launchEnvironmentOption = LaunchEnvironment(key: "MADE_WITH_LOVE_BY", value: "PGS")
let launchEnvironmentDictionary: LaunchEnvironments = ["CORPORATION_KEY": "PGS", "PROJECT_KEY": "AutoMate"]
```

## Handling

All launch environments are available in the application from `ProcessInfo`.

```swift
let madeWithLove = ProcessInfo.processInfo.environment["MADE_WITH_LOVE_BY"]
let corporationKey = ProcessInfo.processInfo.environment["CORPORATION_KEY"]
let projectKey = ProcessInfo.processInfo.environment["PROJECT_KEY"]
```
