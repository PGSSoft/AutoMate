import XCTest

public extension NSPredicate {
    static func identifier(that comparisonOperator: StringComparisonOperator = .equals, _ identifier: String) -> NSPredicate {
        return attribute(\XCUIElementAttributes.identifier, that: comparisonOperator, identifier)
    }

    static func label(that comparisonOperator: StringComparisonOperator = .equals, _ label: String) -> NSPredicate {
        return attribute(\XCUIElementAttributes.label, that: comparisonOperator, label)
    }

    static func identifier(that comparisonOperator: StringComparisonOperator = .equals, _ locator: Locator) -> NSPredicate {
        return identifier(that: comparisonOperator, locator.identifier)
    }

    static func attribute(_ keyPathAttribute: AnyKeyPath, that comparisonOperator: StringComparisonOperator = .equals, _ value: String) -> NSPredicate {
        return NSPredicate(format: "\(keyPathAttribute._kvcKeyPathString!) \(comparisonOperator.rawValue) %@", value)
    }

    static func & (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
        return NSCompoundPredicate(andPredicateWithSubpredicates: [lhs, rhs])
    }
}
