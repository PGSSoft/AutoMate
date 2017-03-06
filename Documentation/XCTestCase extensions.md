Overview of extensions to `XCTestCase` provided by AutoMate.
#### Table of contents
* [`func waitForElementToExist(element: XCUIElement, timeout: NSTimeInterval)`](#func-waitforelementtoexistelement-xcuielement-timeout-nstimeinterval)
* [`func waitForVisibleElement(element: XCUIElement, timeout: NSTimeInterval)`](#func-waitforvisibleelementelement-xcuielement-timeout-nstimeinterval)

#### Snippets

##### `func waitForElementToExist(element: XCUIElement, timeout: NSTimeInterval)`
~~~swift
let button = app.buttons.element
waitForElementToExist(button)
~~~
This method will wait for the given element to exist. It's implemented by executing `waitForExpectationsWithTimeout` underneath.

##### `func waitForVisibleElement(element: XCUIElement, timeout: NSTimeInterval)`
~~~swift
let button = app.buttons.element
waitForVisibleElement(button)
~~~
Similiar to `waitForElementForExist`, but will wait until element becomes visible. Useful if some background activity is being performed in the background that would change appearance of the app when finished.