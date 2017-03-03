`XCTestCase` extension adds additional wait methods. Which allows waiting for existing or visible elements.
Useful if some background activity is being performed in the background that would change appearance
of the application when finished. If this doesn't happen then test will fail.

**Example:**

Wait, by default 10 seconds, until the button will be visible (`exists` and `hittable` properties will be `true`).

```swift
let button = view.buttons["appearingButton"]
wait(forVisibilityOf: button)
```

In addition, those extensions support also the `IdentifiableByElement` protocol which allows to use for example page objects.

**Example:**

```swift
lazy var mainPage: MainPage = MainPage(in: self.app)
wait(forVisibilityOf: mainPage)
```
