# Changelog

## Unreleased

#### Added
- More generic version of `wait(...)` methods: `wait(forFulfillmentOf predicate:...)`.
- `wait(forInvisibilityOf...)` method which is waiting for element to disappear.

## [1.1.0](https://github.com/PGSSoft/AutoMate/releases/tag/1.1.0)
Released on 2017-03-15.

#### Added
- View Objects: `BaseAppViewProtocol`, `BaseAppView`, `ModalView`, `PushedView`, `HealthPermissionView`
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
