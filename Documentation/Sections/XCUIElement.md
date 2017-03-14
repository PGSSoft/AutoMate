`XCUIElement` extension contains additional methods for handling swipes, tapping on elements or clearing text fields.

The `isVisible` property indicates if the element exists and is hittable.
There are cases where checking only `hittable` property is not working as expected.

The `text` property can be used to retrieve value from text field as `String`.

`swipe(from:to:)` is an alternative to `swipeUp`, `swipeDown`, `swipeLeft` and `swipeBottom` methods provided by `XCTest`.
It lets you specify coordinates on the screen (relative to the view on which the method is called).

**Example:**

```swift
let scroll = app.scrollViews.element
scroll.swipe(from: CGVector(dx: 0, dy: 0), to: CGVector(dx: 1, dy: 1))
```

`swipe(to:avoidKeyboard:from:)` variation scrolls the screen until given element becomes visible.
Note that `XCTest` automatically does the scrolling during `tap()`, but the method is still useful in some situations,
for example to reveal element from behind keyboard.

**Example:**

```swift
let scroll = app.scrollViews.element
let button = scroll.buttons.element
scroll.swipe(to: button)
```

`clearTextField()` and `clear(andType:)` provides straightforward method to delete text from text field and then type the provided string.

`tapWithOffset` performs `tap()` on given coordinates (relative to the receiving element).
Can be used to test view where position of the tap matters. It's also possible to tap a subview (like table view cell), without actually queuing that subview.
