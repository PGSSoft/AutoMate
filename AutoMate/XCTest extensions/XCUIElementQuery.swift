//
//  XCUIElementQuery.swift
//  AutoMate
//
//  Created by Pawel Szot on 02/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

///Represents available string comparision operations to perform with NSPredicate API.
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

    /**
     Initialize StringComparision operator with string.
     - parameter rawValue: String to use. If it doesn't match any preexisting cases, it will be parsed as .Other.
     */
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
    /**
     Returns element with label maching provided string.

     - parameter text: String to search for.
     - parameter comparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withLabelMatching text: String, comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(matching: NSPredicate(format: "label \(comparisonOperator.rawValue) '\(text)'"))
    }

    /**
     Returns element with identifier and label matching provided values.

     - parameter identifier: Identifier of element to search for.
     - parameter label: Label of element to search for.
     - parameter labelComparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withIdentifier identifier: String, label: String, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let predicate = NSPredicate(format: "identifier == '\(identifier)' AND label \(labelComparisonOperator.rawValue) '\(label)'")
        return element(matching: predicate)
    }

    /**
     Returns element that contains children matching provided identifier-label dictionary.

     - note: This method is intended to be used with table and collection views, where cells have to be identified by their contents.
     - parameter containingLabels: [String : String] dictionary of identifiers and values to search for.
     - parameter labelsComparisonOperator: StringComparisonOperator that will be used to compare XCUIElement label with searched one, .Equals/'==' by default.
     - returns: first XCUIElement containing all given labels.
     */
    public func element(containingLabels dictionary: [String: String], labelsComparisonOperator comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let predicateString = "identifier == %@ AND label \(comparisonOperator.rawValue) %@"
        var query = self
        for (identifier, label) in dictionary {
            let predicate = NSPredicate(format: predicateString, argumentArray: [identifier, label])
            query = query.containing(predicate)
        }

        return query.element
    }

    /**
     - parameter text: String searched prefix
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withLabelPrefixed text: String) -> XCUIElement {
        return element(withLabelMatching: text, comparisonOperator: .beginsWith)
    }

    /**
     - parameter text: String searched text
     - returns: XCUIElement that matches the type and label that contains given text.
     */
    public func element(withLabelContaining text: String) -> XCUIElement {
        return element(withLabelMatching: text, comparisonOperator: .contains)
    }
}

// MARK: - Locators
public extension XCUIElementQuery {
    /**
     Returns XCUIElement that matches the type and locator.
     */
    public subscript(locator: Locator) -> XCUIElement {
        return self[locator.identifier]
    }

    /**
     - parameter locator: Object conforming to Locator.
     - returns: XCUIElement that matches the type and label that begins with locator.
     */
    public func element(withLabelPrefixed locator: Locator) -> XCUIElement {
        return element(withLabelPrefixed: locator.identifier)
    }

    /**
     - parameter locator: Object conforming to Locator.
     - returns: XCUIElement that matches the type and label that contains locator.
     */
    public func element(withLabelContaining locator: Locator) -> XCUIElement {
        return element(withLabelContaining: locator.identifier)
    }

    /**
     Returns element with label maching provided Locator.

     - parameter locator: Locator to search for.
     - parameter comparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given locator.
     */
    public func element(withLabelMatchingLocator locator: Locator, comparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withLabelMatching: locator.identifier, comparisonOperator: comparisonOperator)
    }

    /**
     Returns element with identifier and label matching provided values.

     - parameter locator: Identifier of element to search for.
     - parameter label: Label of element to search for.
     - parameter labelComparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withLocator locator: Locator, label: Locator, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withLocator: locator, label: label.identifier, labelComparisonOperator: labelComparisonOperator)
    }

    /**
     Returns element with identifier and label matching provided values.

     - parameter identifier: Identifier of element to search for.
     - parameter label: Label of element to search for.
     - parameter labelComparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withLocator locator: Locator, label: String, labelComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        return element(withIdentifier: locator.identifier, label: label, labelComparisonOperator: labelComparisonOperator)
    }

    /**
     Returns element that contains children matching provided identifier-label dictionary.

     - note: This method is intended to be used with table and collection views, where cells have to be identified by their contents.
     - parameter containingLabels: [String : String] dictionary of identifiers and values to search for.
     - parameter labelsComparisonOperator: StringComparisonOperator that will be used to compare XCUIElement label with searched one, .Equals/'==' by default.
     - returns: first XCUIElement containing all given labels.
     */
    public func element <LocatorItem: Locator> (containingLabels dictionary: [LocatorItem: String], labelsComparisonOperator: StringComparisonOperator = .equals) -> XCUIElement {
        let dict = dictionary.reduce([:]) { $0.union([$1.key.identifier: $1.value]) }
        return element(containingLabels: dict, labelsComparisonOperator: labelsComparisonOperator)
    }

    /**
     Returns array of existing elements matching given label.

     - parameter containingLabels: List of messages.
     - returns: Array of XCUIElement elements.
    */
    public func elements(containingLabels array: [String]) -> [XCUIElement] {
        // TODO: Provide regex to match exact string.
        return array
            .flatMap {element(withLabelContaining: $0)}
            .filter {$0.exists}
    }
}
