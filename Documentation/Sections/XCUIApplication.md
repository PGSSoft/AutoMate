

Overview of extensions to `XCUIApplication` provided by AutoMate.
#### Table of contents
* [`var deviceType: DeviceType`](#var-devicetype-devicetype)
* [`var isRunningOnIpad: Bool`](#var-isrunningonipad-bool)
* [`var isRunningOnIphone: Bool`](#var-isrunningoniphone-bool)
* [`var isRunningOnSimulator: Bool`](#var-isrunningonsimulator-bool)
* [`var actualDeviceType: DeviceType`](#var-actualdevicetype-devicetype)
* [`func isRunningOn(deviceType: DeviceType) -> Bool`](#func-isrunningondevicetype-devicetype---bool)

#### Snippets

##### `var deviceType: DeviceType`
~~~swift
if app.deviceType == .iPhone35 {
    let button = app.buttons["more"]
    button.tap()
}
~~~
`deviceType` uses screen size to guess device that tests are running on. May be useful if there is some device specific behaviour that has to be checked. Note that `XCUIApplication` already has `verticalSizeClass` and `horizontalSizeClass` that can be used to distinguish between different layouts from interface designer.


##### `var isRunningOnIpad: Bool`
~~~swift
if app.isRunningOnIpad {
    button.tap()
}
~~~
Indicates if the current device is an iPad, by checking the `deviceType` property.


##### `var isRunningOnIphone: Bool`
~~~swift
if app.isRunningOnIpad {
    button.tap()
}
~~~
Indicates if the current device is an iPhone, by checking the `deviceType` property.


##### `var isRunningOnSimulator: Bool`
~~~swift
if isRunningOnSimulator {
    print("Running on simulator")
}
~~~
Indicates if tests are running inside iOS simulator, by looking for specific environment variable.


##### `var actualDeviceType: DeviceType`
~~~swift
if app.actualDeviceType == .iPhone47 && app.deviceType == .iPhone40 {
    print("Detected iPhone 6 in zoom mode")
}
~~~
Bigger phones may have zoom mode enabled. In that case reported screen size will be smaller. It's still possible to check actual device type by examining the device identifier.


##### `func isRunningOn(deviceType: DeviceType) -> Bool`
~~~swift
if isRunningOn(.iPhone35) {
    button.tap()
}
~~~
Convenience function for checking if current device is of a given type.