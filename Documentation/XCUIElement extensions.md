Overview of extensions to `XCUIElement` provided by AutoMate.
#### Table of contents
* [`var any: XCUIElementQuery`](#var-any-xcuielementquery)
* [`var isVisible : Bool`](#var-isvisible--bool)
* [`func swipe(from startVector: CGVector, to stopVector: CGVector)`](#func-swipefrom-startvector-cgvector-to-stopvector-cgvector)
* [`func swipe(to element: XCUIElement, avoidKeyboard: Bool)`](#func-swipeto-element-xcuielement-avoidkeyboard-bool)
* [`func clearTextField()`](#func-cleartextfield)
* [`func clearAndType(text: String)`](#func-clearandtypetext-string)
* [`func tapWithOffset(offset: CGVector)`](#func-tapwithoffsetoffset-cgvector)
* [`func tapLeftButtonOnSystemAlert()`](#func-tapleftbuttononsystemalert)

#### Snippets


##### `var any: XCUIElementQuery`
~~~swift
//check that the first cells has any subviews
XCTAssertTrue(app.cells.elementBoundByIndex(0).any.count > 0)
~~~
Creates a query that matches all descendants of the element.


##### `var isVisible : Bool`

~~~swift
let button = app.buttons.element
button.tap()
XCTAssertTrue(button.isVisible)
~~~

`isVisible` indicates if element element exists and is hittable. There are cases where checking only `hittable` property is not working as expected.


##### `func swipe(from startVector: CGVector, to stopVector: CGVector)`

~~~swift
let scroll = app.scrollViews.element
scroll.swipe(from: CGVector(dx: 0, dy: 0), to: CGVector(dx: 1, dy: 1))
~~~
Swipe is an alternative to `swipeUp`, `swipeDown`, `swipeLeft` and `swipeBottom` methods provided by XCTest. It lets you specify coordinates on the screen (relative to the view on which the method is called). In the snippet, swipe is performed from left top corner to bottom right.


##### `func swipe(to element: XCUIElement, avoidKeyboard: Bool)`
~~~swift
let scroll = app.scrollViews.element
let button = scroll.buttons.element
scroll.swipe(to:button)
~~~
This variation of swipe scrolls the screen until given element becomes visible. Note that XCTest automatically does the scrolling during `tap()`, but the method is still useful in some situations, for example to reveal element from behind keyboard.


##### `func clearTextField()`
~~~swift
let textField = app.textFields.element
textField.clearTextField()
~~~
XCTest doesn't provide straightforward method to delete text from textField. `clearTextField` solves it by removing text character by character, until the textField is empty.


##### `func clearAndType(text: String)`
~~~swift
let textField = app.textFields.element
textField.clearAndType("text")
~~~
Useful if there is chance that the element contains text already. This helper method will execute `clearTextField` and then type the provided string.


##### `func tapWithOffset(offset: CGVector)`
~~~swift
let element = app.tableViews.element
element.tapWithOffset(CGVector(dx: 0.5, dy: 0.5))
~~~
`tapWithOffset` performs `tap()` on given coordinates (relative to the receiving element). Can be used to test view where position of the tap matters. It's also possible to tap a subview (like table view cell), without actually queuing that subview.


##### `func tapLeftButtonOnSystemAlert()`
~~~swift
addUIInterruptionMonitorWithDescription("Location") { (element) -> Bool in
    element.tapLeftButtonOnSystemAlert()
    return true
}
let button = app.buttons["login"]
button.tap()
~~~
`tapLeftButtonOnSystemAlert` provides simple way to dismiss system alert. It does that by searching for button using known localisations of "Don't Allow" or "OK" texts.