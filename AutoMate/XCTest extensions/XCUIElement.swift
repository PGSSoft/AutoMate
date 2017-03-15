//
//  XCUIElement.swift
//  AutoMate
//
//  Created by Pawel Szot on 29/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

public extension XCUIElement {

    // MARK: Properties
    /// Indicates if the element is currently visible on the screen.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let button = app.buttons.element
    /// button.tap()
    /// XCTAssertTrue(button.isVisible)
    /// ```
    public var isVisible: Bool {
        // When accessing properties of XCUIElement, XCTest works differently than in a case of actions on elements
        // - there is no waiting for the app to idle and to finish all animations.
        // This can lead to problems and test flakiness as the test will evaluate a query before e.g. view transition has been completed.
        XCUIDevice.shared().orientation = .unknown
        return exists && isHittable
    }

    /// Returns `value` as a String
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let textField = app.textFields.element
    /// let text = textField.text
    /// ```
    ///
    /// - note:
    /// It will fail if `value` is not a `String` type.
    public var text: String {
        guard let text = value as? String else {
            preconditionFailure("Value: \(value) is not a String")
        }
        return text
    }

    // MARK: Methods
    /// Perform swipe gesture on this view by swiping between provided points.
    ///
    /// It is an alternative to `swipeUp`, `swipeDown`, `swipeLeft` and `swipeBottom` methods provided by `XCTest`.
    /// It lets you specify coordinates on the screen (relative to the view on which the method is called).
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let scroll = app.scrollViews.element
    /// scroll.swipe(from: CGVector(dx: 0, dy: 0), to: CGVector(dx: 1, dy: 1))
    /// ```
    ///
    /// - Parameters:
    ///   - startVector: Relative point from which to start swipe.
    ///   - stopVector: Relative point to end swipe.
    public func swipe(from startVector: CGVector, to stopVector: CGVector) {
        let p1 = coordinate(withNormalizedOffset: startVector)
        let p2 = coordinate(withNormalizedOffset: stopVector)
        p1.press(forDuration: 0.1, thenDragTo: p2)
    }

    /// Swipe scroll view to reveal given element.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let scroll = app.scrollViews.element
    /// let button = scroll.buttons.element
    /// scroll.swipe(to: button)
    /// ```
    ///
    /// - note:
    ///   `XCTest` automatically does the scrolling during `tap()`, but the method is still useful in some situations, for example to reveal element from behind keyboard, navigation bar or userdefined element.
    /// - note:
    ///   This method assumes that element is scrollable and at least partially visible on the screen.
    ///
    /// - Parameters:
    ///   - element: Element to scroll to.
    ///   - avoid: Table of `AvoidableElement` that should be avoid while swiping, by default keyboard and navigation bar are passed.
    ///   - app: Application instance to use when searching for keyboard to avoid
    public func swipe(to element: XCUIElement, avoid viewsToAviod: [AvoidableElement] = [.keyboard, .navigationBar], from app: XCUIApplication = XCUIApplication()) {
        let swipeLength: CGFloat = 0.9
        var scrollableArea = frame

        viewsToAviod.forEach {
            scrollableArea = $0.overlapReminder(of: scrollableArea, in: app)
            print(scrollableArea)
        }
        assert(scrollableArea.height > 0, "Scrollable view is completely hidden.")

        func scroll(deltaY: CGFloat, condition: () -> (Bool)) {
            var oldElementFrame = element.frame
            while condition() {
                // calculate swipe points so that they fit into scrollabel area
                let offset = scrollableArea.height / frame.height * (deltaY / 2)
                let center = scrollableArea.height / 2 / frame.height

                swipe(from: CGVector(dx: 0.5, dy: center + offset), to: CGVector(dx: 0.5, dy: center - offset))
                guard oldElementFrame != element.frame else {
                    break
                }
                oldElementFrame = element.frame
            }
        }

        scroll(deltaY: swipeLength) { element.frame.maxY > scrollableArea.maxY }
        scroll(deltaY: -swipeLength) { element.frame.minY < scrollableArea.minY }

        assert(scrollableArea.contains(element.frame), "Failed to reveal element.")
    }

    /// Remove text from textField or secureTextField.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let textField = app.textFields.element
    /// textField.clearTextField()
    /// ```
    public func clearTextField() {
        // Since iOS 9.1 the keyboard identifiers are available.
        // On iOS 9.0 the special character `\u{8}` (backspace) is used.
        if #available(iOS 9.1, *) {
            let app = XCUIApplication()
            let deleteButton = app.keys[KeyboardLocator.delete]
            var previousValueLength = 0
            while self.text.characters.count != previousValueLength {
                // Keep removing characters until text is empty, or removing them is not allowed.
                previousValueLength = self.text.characters.count
                deleteButton.tap()
            }
        } else {
            var previousValueLength = 0
            while self.text.characters.count != previousValueLength {
                // Keep removing characters until text is empty, or removing them is not allowed.
                previousValueLength = self.text.characters.count
                typeText("\u{8}")
            }
        }
    }

    /// Remove text from textField and enter new value.
    ///
    /// Useful if there is chance that the element contains text already.
    /// This helper method will execute `clearTextField` and then type the provided string.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let textField = app.textFields.element
    /// textField.clear(andType: "text")
    /// ```
    ///
    /// - Parameter text: Text to type after clearing old value.
    public func clear(andType text: String) {
        tap()
        clearTextField()
        typeText(text)
    }

    /// Tap element with given offset. By default taps in the upper left corner (dx=0, dy=0).
    /// Tap point is calculated by adding the offset multiplied by the size of the element’s frame to the origin of the element’s frame.
    /// So the correct values are from range: <0, 1>.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.tap(withOffset: CGVector(dx: 0.5, dy: 0.5))
    /// ```
    ///
    /// - Parameter offset: Tap offset. Default (0, 0).
    public func tap(withOffset offset: CGVector = CGVector.zero) {
        coordinate(withNormalizedOffset: offset).tap()
    }
}

// MARK: - AvoidableElement
/// Each case means element of user interface that can overlap scrollable area.
///
/// - `navigationBar`: equivalent of `UINavigationBar`.
/// - `keyboard`: equivalent of `UIKeyboard`.
/// - `other(XCUIElement, CGRectEdge)`: equivalent of user defined `XCUIElement` with `CGRectEdge` on which it appears.
/// If more than one navigation bar or any other predefined `AvoidableElement` is expected, use `.other` case.
/// Predefined cases assume there is only one element of their type.
public enum AvoidableElement {
    /// Equivalent of `UINavigationBar`.
    case navigationBar
    /// Equivalent of `UIKeyboard`.
    case keyboard
    /// Equivalent of user defined `XCUIElement` with `CGRectEdge` on which it appears.
    case other(element: XCUIElement, edge: CGRectEdge)

    /// Edge on which `XCUIElement` appears.
    var edge: CGRectEdge {
        switch self {
        case .navigationBar: return .minYEdge
        case .keyboard: return .maxYEdge
        case .other(_, let edge): return edge
        }
    }

    /// Finds `XCUIElement` depending on case.
    ///
    /// - Parameter app: XCUIAppliaction to search through, `XCUIApplication()` by default.
    /// - Returns: `XCUIElement` equivalent of enum case.
    func element(in app: XCUIApplication = XCUIApplication()) -> XCUIElement {
        switch self {
        case .navigationBar: return app.navigationBars.element
        case .keyboard: return app.keyboards.element
        case .other(let element, _): return element
        }
    }

    /// Calculates rect that reminds scrollable through substract overlaping part of `XCUIElement`.
    ///
    /// - Parameters:
    ///   - rect: CGRect that is overlaped.
    ///   - app: XCUIApplication in which overlapping element can be found.
    /// - Returns: Part of rect not overlaped by element.
    func overlapReminder(of rect: CGRect, in app: XCUIApplication = XCUIApplication()) -> CGRect {

        let overlappingElement = element(in: app)
        guard overlappingElement.exists else { return rect }

        let overlap: CGFloat

        switch edge {
        case .maxYEdge:
            overlap = rect.maxY - overlappingElement.frame.minY
        case .minYEdge:
            overlap = overlappingElement.frame.maxY - rect.minY
        default:
            return rect
        }

        return rect.divided(atDistance: max(overlap, 0),
                            from: edge).remainder
    }
}
