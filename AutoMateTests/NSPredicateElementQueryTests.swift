import XCTest
import Foundation
@testable import AutoMate

class NSPredicateElementQueryTests: XCTestCase {

    func testElementWithKeyPathAttributePredicate() {
        let sut = NSPredicate.attribute(\XCUIElementAttributes.value, that: .matches, "XYZ")
        XCTAssertEqual(sut, NSPredicate(format: "value MATCHES \"XYZ\""))
    }
    
    func testElementWithIdentifierThatEndsWithValuePredicate() {
        let sut = NSPredicate.identifier(that: .endsWith, "accessibility")
        XCTAssertEqual(sut, NSPredicate(format: "identifier ENDSWITH \"accessibility\""))
    }
    
    func testElementWithLabelThatBeginsWithValuePredicate() {
        let sut = NSPredicate.label(that: .beginsWith, "Sir John")
        XCTAssertEqual(sut, NSPredicate(format: "label BEGINSWITH \"Sir John\""))
    }
}
