# Changelog

## [1.4.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.4.0)
Released on 2017-07-03.

#### Added
- Check if application is running in UI test environment (with `AutoMate-AppBuddy`)

## [1.3.1](https://github.com/PGSSoft/AutoMate/releases/tag/1.3.1)
Released on 2017-04-11.

#### Added
- Smart coordinates `SmartXCUICoordinate`.

#### Updated
- Disabled Bitcode for Cocoapods.
- Adjusted swipe and tap methods to use smart coordinates.

## [1.3.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.3.0)
Released on 2017-04-10.

#### Added
- Added `element(withIdentifier:labels:labelComparisonOperator:)`
- Added `swipe(to:times:avoid:from:until:)`, `swipe(to:untilExist:times:avoid:from:)` and `swipe(to:untilVisible:times:avoid:from:)` to use with collection views.
- Improve launch options type safety

## [1.2.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.2.0)
Released on 2017-03-29.

#### Added
- More generic version of `wait(...)` methods: `wait(forFulfillmentOf predicate:...)`.
- `wait(forInvisibilityOf...)` method which is waiting for element to disappear.
- Compatibility with Xcode 8.3 and Swift 3.1.

## [1.1.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.1.0)
Released on 2017-03-15.

#### Added
- Page Objects: `BaseAppPageProtocol`, `BaseAppPage`, `ModalPage`, `PushedPage`, `HealthPermissionView`
- `IdentifiableByElement` protocol
- `Locator` protocol
- `AppUITestCase` as base `XCTestCase` template
- Disable UIView animations (with `AutoMate-AppBuddy`)
- Improve handling of system alerts (with `AutoMate-ModelGenie`)
- Most permissions alerts (like: `LocationWhenInUseAlert`, `CalendarAlert`, `PhotosAlert`) (with `AutoMate-Templates`)
- Managing events, reminders and contacts (with `AutoMate-AppBuddy`)

#### Updated
- Documentation

## [1.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.0)
Released on 2016-09-23.

#### Added
- CoreData debug launch options.
- String localization debug options.
- Extensions for UI Testing.

#### Updated
- Improved documentation.

## [0.1](https://github.com/PGSSoft/AutoMate/releases/tag/0.1)
Released on 2016-08-05.

#### Added
- General utilities for configuring tested application.
- System keyboards launch argument.
- System locale launch argument.
- System languages launch argument.
