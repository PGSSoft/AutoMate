`XCUIElementQuery` extension contains additional methods for identifying and searching elements.

`element(withLabelMatching:comparisonOperator:)` returns element with label matching provided string.
String matching is customizable with operators available in `NSPredicate` specification.

**Example:**

```swift
let text = app.staticTexts.element(withLabelMatching: "John*", comparisonOperator: .like)
XCTAssertTrue(text.exists)
```

`elements(withLabelsMatching:comparisonOperator:)` is a similar method but
can be used when looking for an element which label can match one of many texts.

**Example:**

```swift
let texts = ["OK", "Done", "Go"]
let elements = app.buttons.elements(withLabelsMatching: texts, comparisonOperator: .equals)
```

`element(withIdentifier:label:labelComparisonOperator:)` can be used to find element with given identifier and label.
Useful to find a cell which `UILabel`, with provided `identifier`, contains text provided by `label`.

**Example:**

```swift
let cell = app.cells.element(withIdentifier: "title", label: "Made with love")
```

`element(containingLabels:labelsComparisonOperator:)` is an extension to previous method.
Searches for element that has sub-elements matching provided "identifier:label" pairs.
Especially useful for table views and collection views where cells will have the same identifier. 

**Example:**

```swift
let tableView = app.tables.element
let cell = tableView.cells.element(containingLabels: ["name": "John*", "email": "*.com"], labelsComparisonOperator: .like)
XCTAssertTrue(cell.exists)
```

In addition shorted variants are available:

- `element(withLabelPrefixed:)`
- `element(withLabelContaining:)`
- `elements(withLabelsContaining:)`
- `elements(withLabelsLike:)`

Modifications for `Locator` protocol are also available:

- `element(withLabelMatchingLocator:comparisonOperator:)`
- `element(withLocator:label:labelComparisonOperator:)`
- `element(containingLabels:labelsComparisonOperator:)`
