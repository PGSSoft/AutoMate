
`XCUIApplication` extension contains additional properties and methods which detects currently running
target like iOS device, iOS Simulator, iPad or iPhone.

`deviceType` uses screen size to guess device that tests are running on.
May be useful if there is some device specific behaviour that has to be checked.
Note that `XCUIApplication` already has `verticalSizeClass` and `horizontalSizeClass`
that can be used to distinguish between different layouts from interface designer.

**Example:**

```swift
if app.deviceType == .iPhone35 {
    let button = app.buttons["more"]
    button.tap()
}
```

In addition to `deviceType`, the `actualDeviceType` can return device type depending on device identifier.
Bigger phones may have zoom mode enabled. In that case reported screen size will be smaller.

**Example:**

```swift
if app.actualDeviceType == .iPhone47 && app.deviceType == .iPhone40 {
    print("Detected iPhone 6 in zoom mode")
}
```

Extension contains set of helper properties around `deviceType` which returns `Bool` value:

- `isRunningOnIpad`
- `isRunningOnIphone`
- `isRunningOnSimulator`
- `isRunningOn(_:)`
