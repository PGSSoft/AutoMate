# AutoMate environments

In addition to system launch arguments `AutoMate` and [`AutoMate - AppBuddy`](https://github.com/PGSSoft/AutoMate-AppBuddy)
provides advanced launch environments which can manage events, reminders and contacts.

They can be passed to the `TestLauncher` to configure the application before launch.
Use `TestLauncher` in the `setUp()` method to configure application settings and launch the application:

```swift
let app = XCUIApplication()
TestLauncher(options: [
    animation,
    isInUITest,
    events,
    reminders,
    contacts
]).configure(app).launch()
```

## Animations

`AnimationLaunchEnvironment` can provides information to the application to disable all UI animations.

```swift
let animation = AnimationLaunchEnvironment()
```

## Is in UI test

`IsInUITestLaunchEnvironment` provides information to the application that it is running in UI test environment.
In some scenarios such knowledge is useful. You can read
[How to Detect Whether an Application Is Running Inside a UI Test Environment](http://macoscope.com/blog/how-to-detect-whether-an-application-is-running-inside-a-ui-test-environment/)
to get some insights.

```swift
let isInUITest = IsInUITestLaunchEnvironment()
```

## Events and reminders

`EventLaunchEnvironment` and `ReminderLaunchEnvironment` can pass to the application list of JSON files
with events and reminders which will be created on the application start.

In a test file:

```swift
let events = EventLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "todays_events", bundleName: "Test data"))
let reminders = ReminderLaunchEnvironment(resources: (fileName: "automate_release_reminders", bundleName: nil))
```

`todays_events.json` (in bundle the `Test data.bundle`):

```json
[
  {
    "title": "Minimal Event Title",
    "startDate": "2017-01-22 13:45:00",
    "endDate": "2017-01-22 14:30:00"
  }
]
```

`automate_release_reminders.json` (in the application bundle):

```json
[
  {
    "title": "Minimal Event Title",
    "priority": 3
  }
]
```

The `shouldCleanBefore` will remove all existing events or reminders on a phone or simulator before adding a new one.

For handling in the application and for full list of possible values please refer
to the [`AutoMate - AppBuddy`](https://github.com/PGSSoft/AutoMate-AppBuddy) documentation.

**Note:**

A calendar has to exist on a simulator or on an iPhone for EventKit launch environments to work.

## Contacts

`ContactLaunchEnvironment` can pass to the application list of JSON files
with contacts which will be created on the application start.

In a test file:

```swift
let contacts = ContactLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "michael", bundleName: "Test data"))
```

`michael.json` (in bundle the `Test data.bundle`):

```json
[
  {
    "contactType": "person",
    "givenName": "Michael"
  }
]
```

The `shouldCleanBefore` will remove all existing contacts on a phone or simulator before adding a new one.

For handling in the application and for full list of possible values please refer
to the [`AutoMate - AppBuddy`](https://github.com/PGSSoft/AutoMate-AppBuddy) documentation.
