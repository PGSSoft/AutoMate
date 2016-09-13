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
        return self.element(matching: NSPredicate(format: "label \(comparisonOperator.rawValue) '\(text)'"))
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
        return self.element(matching: predicate)
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
}
