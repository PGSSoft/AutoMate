`XCUIElementTypeQueryProvider` extension contains additional `any` property
which returns all descendant objects of `XCUIElementType.any` type.

**Example:**

```swift
XCTAssertTrue(app.cells.any.count > 0)
```

Matches all descendants of elements from the query.
