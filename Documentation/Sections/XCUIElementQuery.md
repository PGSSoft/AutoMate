Overview of extensions to `XCUIElementQuery` provided by AutoMate.
#### Table of contents
* [`var any: XCUIElementQuery`](#var-any-xcuielementquery)
* [`func element(withLabelMatching text: String, comparisonOperator: StringComparisonOperator) -> XCUIElement`](#func-elementwithlabelmatching-text-string-comparisonoperator-stringcomparisonoperator---xcuielement)
* [`func element(withIdentifier identifier: String, label: String, labelComparisonOperator: StringComparisonOperator) -> XCUIElement`](#func-elementwithidentifier-identifier-string-label-string-labelcomparisonoperator-stringcomparisonoperator---xcuielement)
* [`func element(containingLabels dictionary: [String: String], labelsComparisonOperator comparisonOperator: StringComparisonOperator) -> XCUIElement`](#func-elementcontaininglabels-dictionary-string-string-labelscomparisonoperator-comparisonoperator-stringcomparisonoperator---xcuielement)

#### Snippets


##### `var any: XCUIElementQuery`
~~~swift
XCTAssertTrue(app.cells.any.count > 0)
~~~
Matches all descendants of elements from the query.


##### `func element(withLabelMatching text: String, comparisonOperator: StringComparisonOperator) -> XCUIElement`
~~~swift
let text = app.staticTexts.element(withLabelMatching: "John*", comparisonOperator: .Like)
XCTAssertTrue(text.exists)
~~~
Searches for element in the query with label matching provided string. String matching is customizable with operators available in NSPredicate specification.

##### `func element(withIdentifier identifier: String, label: String, labelComparisonOperator: StringComparisonOperator) -> XCUIElement `
~~~swift
let text = app.staticTexts.element(withIdentifier: "name", label: "John*", labelComparisonOperator: .Like)
XCTAssertTrue(text.exists)
~~~
Searches for element in the query with given identifier and a label matching provided string. String matching is customizable with operators available in NSPredicate specification.

##### `func element(containingLabels dictionary: [String: String], labelsComparisonOperator comparisonOperator: StringComparisonOperator) -> XCUIElement`
~~~swift
let tableView = app.tables.element
let cell = tableView.cells.element(containingLabels: ["name": "John*", "email": "*.com"], labelsComparisonOperator: .Like)
XCTAssertTrue(cell.exists)
~~~
Searches for element that has sub-elements matching provided identifier:label pairs. Especially useful for table views and collection views where cells will have the same identifier. 
