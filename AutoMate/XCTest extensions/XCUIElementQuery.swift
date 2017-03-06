//
//  XCUIElementQuery.swift
//  AutoMate
//
//  Created by Pawel Szot on 02/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

/// Represents available string comparision operations to perform with NSPredicate API.
///
/// - `equals`: `==` operator
/// - `beginsWith`: `BEGINSWITH` operator
/// - `contains`: `CONTAINS` operator
/// - `endsWith`: `ENDSWITH` operator
/// - `like`: `LIKE` operator
/// - `matches`: `MATCHES` operator
/// - `other`: Custom operator
public enum StringComparisonOperator: RawRepresentable {
    /// Enum value describing NSPredicate string comparision operator.
    case equals, beginsWith, contains, endsWith, like, matches

    /// Custom string operator.
    case other(comparisonOperator: String)

    /// String representation of the `self`.
    public var rawValue: String {
        switch self {
        case .equals: return "=="
        case .beginsWith: return "BEGINSWITH"
        case .contains: return "CONTAINS"
        case .endsWith: return "ENDSWITH"
        case .like: return "LIKE"
        case .matches: return "MATCHES"
        case .other(let comparisonOperator): return comparisonOperator
        }
    }

    /// Initialize comparision operator with string.
    ///
    /// - Parameter rawValue: String to use. If it doesn't match any preexisting cases, it will be parsed as `.other`.
    public init(rawValue: String) {
        switch rawValue {
        case "==": self = .equals
        case "BEGINSWITH": self = .beginsWith
        case "CONTAINS": self = .contains
        case "ENDSWITH": self = .endsWith
        case "LIKE": self = .like
        case "MATCHES": self = .matches
        default: self = .other(comparisonOperator: rawValue)
        }
    }
}

public extension XCUIElementQuery {

    // MARK: Methods
    /// Returns element with label matching provided string.
    ///
    /// String matching is customizable with operators available in `NSPredicate` specification.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelMatching: "John*", comparisonOperator: .like)
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameters:
    ///   - text: String to search for.
    ///   - comparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the label to given text.
    public func element(withLabelMatching text: String, comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(matching: NSPredicate(format: "label \(comparisonOperator.rawValue) %@", text))
    }

    /// Returns array of existing elements matching given labels.
    ///
    /// Can be used when looking for an element which label can match to one from many texts.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let texts = ["Ok", "Done", "Go"]
    /// let elements = app.buttons.elements(withLabelsMatching: texts, comparisonOperator: .equals)
    /// ```
    ///
    /// - Parameters:
    ///   - texts: List of labels.
    ///   - comparisonOperator: Operation to use when performing comparison.
    /// - Returns: Array of `XCUIElement` elements.
    public func elements(withLabelsMatching texts: [String], comparisonOperator: StringComparisonOperator = .equals) -> [XCUIElement] {
        return texts
            .flatMap({ element(withLabelMatching: $0, comparisonOperator: comparisonOperator) })
            .filter { $0.exists }
    }

    /// Returns element with identifier and label matching provided values.
    ///
    /// Can be used to find a cell which `UILabel`, with provided `identifier`, contains text provided by `label`.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let cell = app.cells.element(withIdentifier: "title", label: "Made with love")
    /// ```
    ///
    /// - Parameters:
    ///   - identifier: Identifier of element to search for.
    ///   - label: Label of element to search for.
    ///   - labelComparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the identifier and label to given texts.
    public func element(withIdentifier identifier: String, label: String, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let predicate = NSPredicate(format: "identifier == %@ AND label \(labelComparisonOperator.rawValue) %@", identifier, label)
        return element(matching: predicate)
    }
    
    /// Returns element that contains children matching provided identifier-label dictionary.
    ///
    /// Searches for element that has sub-elements matching provided "identifier:label" pairs.
    /// Especially useful for table views and collection views where cells will have the same identifier.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let tableView = app.tables.element
    /// let cell = tableView.cells.element(containingLabels: ["name": "John*", "email": "*.com"], labelsComparisonOperator: .like)
    /// XCTAssertTrue(cell.exists)
    /// ```
    ///
    /// - note: This method is intended to be used with table and collection views, where cells have to be identified by their contents.
    ///
    /// - Parameters:
    ///   - dictionary: Dictionary of identifiers and labels to search for.
    ///   - comparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the identifiers and labels to given texts.
    public func element(containingLabels dictionary: [String: String], labelsComparisonOperator comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let predicateString = "identifier == %@ AND label \(comparisonOperator.rawValue) %@"
        var query = self
        for (identifier, label) in dictionary {
            let predicate = NSPredicate(format: predicateString, argumentArray: [identifier, label])
            query = query.containing(predicate)
        }

        return query.element
    }
}

public extension XCUIElementQuery {
    // MARK: Shorted
    /// Returns element with label which begins with provided string.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelPrefixed: "John")
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameter text: String to search for.
    /// - Returns: `XCUIElement` that the label begins with given text.
    public func element(withLabelPrefixed text: String) -> XCUIElement {
        return element(withLabelMatching: text, comparisonOperator: .beginsWith)
    }

    /// Returns element with label which contains provided string.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelContaining: "John")
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameter text: String to search for.
    /// - Returns: `XCUIElement` that the label contains given text.
    public func element(withLabelContaining text: String) -> XCUIElement {
        return element(withLabelMatching: text, comparisonOperator: .contains)
    }

    /// Returns array of existing elements containing given labels.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let texts = ["Ok", "Done", "Go"]
    /// let elements = app.buttons.elements(withLabelsContaining: texts)
    /// ```
    ///
    /// - Parameter texts: List of labels.
    /// - Returns: Array of `XCUIElement` elements.
    public func elements(withLabelsContaining texts: [String]) -> [XCUIElement] {
        return elements(withLabelsMatching: texts, comparisonOperator: .contains)
    }

    /// Returns array of existing elements `like` given labels.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let texts = ["Ok", ".*Done", "Go"]
    /// let elements = app.buttons.elements(withLabelsLike: texts)
    /// ```
    ///
    /// - Parameter texts: List of labels.
    /// - Returns: Array of `XCUIElement` elements.
    public func elements(withLabelsLike texts: [String]) -> [XCUIElement] {
        return elements(withLabelsMatching: texts, comparisonOperator: .like)
    }
}

public extension XCUIElementQuery {
    // MARK: Locators
    /// Returns `XCUIElement` that matches the type and locator.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let button = app.buttons[Locators.ok]
    /// ```
    ///
    /// - Parameter locator: `Locator` used to find element
    public subscript(locator: Locator) -> XCUIElement {
        return self[locator.identifier]
    }

    /// Returns element with label matching provided string.
    ///
    /// String matching is customizable with operators available in `NSPredicate` specification.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelMatchingLocator: Locators.john, comparisonOperator: .like)
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameters:
    ///   - locator: Locator to search for.
    ///   - comparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the label to given locator.
    public func element(withLabelMatchingLocator locator: Locator, comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withLabelMatching: locator.identifier, comparisonOperator: comparisonOperator)
    }

    /// Returns element with identifier and label matching provided values.
    ///
    /// Can be used to find a cell which `UILabel`, with provided `identifier`, contains text provided by `label`.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let cell = app.cells.element(withLocator: Locators.title, label: Locators.madeWithLove)
    /// ```
    ///
    /// - Parameters:
    ///   - locator: Identifier of element to search for.
    ///   - label: Label of element to search for.
    ///   - labelComparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the identifier and label to given locators.
    public func element(withLocator locator: Locator, label: Locator, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withLocator: locator, label: label.identifier, labelComparisonOperator: labelComparisonOperator)
    }

    /// Returns element with identifier and label matching provided values.
    ///
    /// Can be used to find a cell which `UILabel`, with provided `identifier`, contains text provided by `label`.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let cell = app.cells.element(withLocator: Locators.title, label: "Made with love")
    /// ```
    ///
    /// - Parameters:
    ///   - locator: Identifier of element to search for.
    ///   - label: Label of element to search for.
    ///   - labelComparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the identifier and label to given locator and text.
    public func element(withLocator locator: Locator, label: String, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withIdentifier: locator.identifier, label: label, labelComparisonOperator: labelComparisonOperator)
    }

    /// Returns element that contains children matching provided identifier-label dictionary.
    ///
    /// Searches for element that has sub-elements matching provided "identifier:label" pairs.
    /// Especially useful for table views and collection views where cells will have the same identifier.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let tableView = app.tables.element
    /// let cell = tableView.cells.element(containingLabels: [Locators.name: "John*", Locators.email: "*.com"], labelsComparisonOperator: .like)
    /// XCTAssertTrue(cell.exists)
    /// ```
    ///
    /// - note: This method is intended to be used with table and collection views, where cells have to be identified by their contents.
    ///
    /// - Parameters:
    ///   - dictionary: Dictionary of identifiers and labels to search for.
    ///   - labelsComparisonOperator: Operation to use when performing comparison.
    /// - Returns: `XCUIElement` that matches the identifiers and labels to given locators and texts.
    public func element <LocatorItem: Locator> (containingLabels dictionary: [LocatorItem: String], labelsComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let dict = dictionary.reduce([:]) { $0.union([$1.key.identifier: $1.value]) }
        return element(containingLabels: dict, labelsComparisonOperator: labelsComparisonOperator)
    }

    // MARK: Shorted
    /// Returns element with label which begins with provided Locator.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelPrefixed: Locators.john)
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameter locator: Object conforming to Locator.
    /// - Returns: `XCUIElement` that the label begins with given locator.
    public func element(withLabelPrefixed locator: Locator) -> XCUIElement {
        return element(withLabelPrefixed: locator.identifier)
    }

    /// Returns element with label which contains provided Locator.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let text = app.staticTexts.element(withLabelContaining: Locators.john)
    /// XCTAssertTrue(text.exists)
    /// ```
    ///
    /// - Parameter locator: Object conforming to Locator.
    /// - Returns: `XCUIElement` that the label contains given locator.
    public func element(withLabelContaining locator: Locator) -> XCUIElement {
        return element(withLabelContaining: locator.identifier)
    }
}
