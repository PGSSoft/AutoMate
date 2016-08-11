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
    case Equals, BeginsWith, Contains, EndsWith, Like, Matches

    /// Custom string operator.
    case Other(comparisonOperator: String)

    /// String representation of the `self`.
    public var rawValue: String {
        switch self {
        case .Equals: return "=="
        case .BeginsWith: return "BEGINSWITH"
        case .Contains: return "CONTAINS"
        case .EndsWith: return "ENDSWITH"
        case .Like: return "LIKE"
        case .Matches: return "MATCHES"
        case .Other(let comparisonOperator): return comparisonOperator
        }
    }

    /**
     Initialize StringComparision operator with string.
     - parameter rawValue: String to use. If it doesn't match any preexisting cases, it will be parsed as .Other.
     */
    public init(rawValue: String) {
        switch rawValue {
        case "==": self = .Equals
        case "BEGINSWITH": self = .BeginsWith
        case "CONTAINS": self = .Contains
        case "ENDSWITH": self = .EndsWith
        case "LIKE": self = .Like
        case "MATCHES": self = .Matches
        default: self = .Other(comparisonOperator: rawValue)
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
    public func element(withLabelMatching text: String, comparisonOperator: StringComparisonOperator = .Equals) -> XCUIElement {
        return elementMatchingPredicate(NSPredicate(format: "label \(comparisonOperator.rawValue) '\(text)'"))
    }

    /**
     Returns element with identifier and label matching provided values.

     - parameter identifier: Identifier of element to search for.
     - parameter label: Label of element to search for.
     - parameter labelComparisonOperator: Operation to use when performing comparison.
     - returns: XCUIElement that matches the type and label that begins with given text.
     */
    public func element(withIdentifier identifier: String, label: String, labelComparisonOperator: StringComparisonOperator = .Equals) -> XCUIElement {
        let predicate = NSPredicate(format: "identifier == '\(identifier)' AND label \(labelComparisonOperator.rawValue) '\(label)'")
        return elementMatchingPredicate(predicate)
    }

    /**
     Returns element that contains children matching provided identifier-label dictionary.

     - note: This method is intended to be used with table and collection views, where cells have to be identified by their contents.
     - parameter containingLabels: [String : String] dictionary of identifiers and values to search for.
     - parameter labelsComparisonOperator: StringComparisonOperator that will be used to compare XCUIElement label with searched one, .Equals/'==' by default.
     - returns: first XCUIElement containing all given labels.
     */
    public func element(containingLabels dictionary: [String: String], labelsComparisonOperator comparisonOperator: StringComparisonOperator = .Equals) -> XCUIElement {
        let predicateString = "identifier == %@ AND label \(comparisonOperator.rawValue) %@"
        var query = self
        for (identifier, label) in dictionary {
            let predicate = NSPredicate(format: predicateString, argumentArray: [identifier, label])
            query = query.containingPredicate(predicate)
        }

        return query.element
    }
}
