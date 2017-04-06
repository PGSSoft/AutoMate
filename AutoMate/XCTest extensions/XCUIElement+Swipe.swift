//
//  XCUIElement+Swipe.swift
//  AutoMate
//
//  Created by Bartosz Janda on 06.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {

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
    ///   `XCTest` automatically does the scrolling during `tap()`, but the method is still useful in some situations, for example to reveal element from behind keyboard, navigation bar or user defined element.
    /// - note:
    ///   This method assumes that element is scrollable and at least partially visible on the screen.
    ///
    /// - Parameters:
    ///   - element: Element to scroll to.
    ///   - avoid: Table of `AvoidableElement` that should be avoid while swiping, by default keyboard and navigation bar are passed.
    ///   - app: Application instance to use when searching for keyboard to avoid.
    public func swipe(to element: XCUIElement, avoid viewsToAviod: [AvoidableElement] = [.keyboard, .navigationBar], from app: XCUIApplication = XCUIApplication()) {
        let scrollableArea = self.scrollableArea(avoid: viewsToAviod, from: app)

        // Distance from scrollable area center to element center.
        func distanceVector() -> CGVector {
            return scrollableArea.center.vector(to: element.frame.center)
        }

        // Scroll until center of the element will be visible.
        var oldDistance = distanceVector().manhattanDistance
        while !scrollableArea.contains(element.frame.center) {

            // Max swipe offset in both directions.
            let maxOffset = CGSize(
                width: scrollableArea.width * swipeLengthX,
                height: scrollableArea.height * swipeLengthY
            )

            // Max possible distance to swipe (in points).
            // It cannot be bigger than `maxOffset`.
            let vector = distanceVector()
            let maxVector = CGVector(
                dx: max(min(vector.dx, maxOffset.width), -maxOffset.width),
                dy: max(min(vector.dy, maxOffset.height), -maxOffset.height)
            )

            // Max possible distance to swipe (normalized).
            let maxNormalizedVector = CGVector(
                dx: maxVector.dx / frame.width,
                dy: maxVector.dy / frame.height
            )

            // Center point.
            let center = CGPoint(
                x: (scrollableArea.midX - frame.minX) / frame.width,
                y: (scrollableArea.midY - frame.minY) / frame.height
            )

            // Start vector.
            let startVector = CGVector(
                dx: center.x + maxNormalizedVector.dx / 2,
                dy: center.y + maxNormalizedVector.dy / 2
            )

            // Stop vector.
            let stopVector = CGVector(
                dx: center.x - maxNormalizedVector.dx / 2,
                dy: center.y - maxNormalizedVector.dy / 2
            )

            // Swipe.
            swipe(from: startVector, to: stopVector)

            // Stop scrolling if distance to element was not changed.
            let newDistance = distanceVector().manhattanDistance
            guard oldDistance > newDistance else {
                break
            }
            oldDistance = newDistance
        }
    }

    /// Swipes scroll view to given direction until element would exist.
    ///
    /// A useful method to scroll collection view to reveal an element.
    /// In collection view, only a few cells are available in the hierarchy.
    /// To scroll to given element you have to provide swipe direction and a maximum number of swipes in that direction (by default 10 swipes).
    /// The method will stop when the maximum number of swipes is reached or when the given element will appear in the view hierarchy.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let collectionView = app.collectionViews.element
    /// let element = collectionView.staticTexts["More"]
    /// collectionView.swipe(to: .down, untilExist: element)
    /// // Optional
    /// collectionView.swipe(to: element)
    /// ```
    ///
    /// - note:
    ///   This method will not scroll untile the view will be visible. To do this call `swipe(to:avoid:from:)` after this method.
    ///
    /// - Parameters:
    ///   - direction: Swipe direction.
    ///   - element: Element to swipe to.
    ///   - times: Maximum number of swipes.
    ///   - viewsToAviod: Table of `AvoidableElement` that should be avoid while swiping, by default keyboard and navigation bar are passed.
    ///   - app: Application instance to use when searching for keyboard to avoid.
    public func swipe(to direction: SwipeDirection, untilExist element: XCUIElement, times: Int = 10, avoid viewsToAviod: [AvoidableElement] = [.keyboard, .navigationBar], from app: XCUIApplication = XCUIApplication()) {

        let scrollableArea = self.scrollableArea(avoid: viewsToAviod, from: app)

        // Swipe `times` times in the provided direction.
        for _ in 0..<times {

            // Stop scrolling when element will exists.
            guard !element.exists else {
                break
            }

            // Max swipe offset in both directions.
            let maxOffset = CGSize(
                width: scrollableArea.width * swipeLengthX,
                height: scrollableArea.height * swipeLengthY
            )

            let vector: CGVector
            switch direction {
            case .up: vector = CGVector(dx: 0, dy: -maxOffset.height)
            case .down: vector = CGVector(dx: 0, dy: maxOffset.height)
            case .left: vector = CGVector(dx: -maxOffset.width, dy: 0)
            case .right: vector = CGVector(dx: maxOffset.width, dy: 0)
            }

            // Max possible distance to swipe (normalized).
            let maxNormalizedVector = CGVector(
                dx: vector.dx / frame.width,
                dy: vector.dy / frame.height
            )

            // Center point.
            let center = CGPoint(
                x: (scrollableArea.midX - frame.minX) / frame.width,
                y: (scrollableArea.midY - frame.minY) / frame.height
            )

            // Start vector.
            let startVector = CGVector(
                dx: center.x + maxNormalizedVector.dx / 2,
                dy: center.y + maxNormalizedVector.dy / 2
            )

            // Stop vector.
            let stopVector = CGVector(
                dx: center.x - maxNormalizedVector.dx / 2,
                dy: center.y - maxNormalizedVector.dy / 2
            )

            // Swipe.
            swipe(from: startVector, to: stopVector)
        }
    }
}

// MARK: - Internal
extension XCUIElement {
    // MARK: Properties
    /// Proportional horizontal swipe length.
    ///
    /// - note:
    /// To avoid swipe to back `swipeLengthX` is lower than `swipeLengthY`.
    var swipeLengthX: CGFloat {
        return 0.7
    }

    /// Proportional vertical swipe length.
    var swipeLengthY: CGFloat {
        return 0.9
    }

    // MARK: Methods
    /// Calculates scrollable are of the element by removing overlapping elements like keybard or navigation bar.
    ///
    /// - Parameters:
    ///   - viewsToAviod: Table of `AvoidableElement` that should be avoid while swiping, by default keyboard and navigation bar are passed.
    ///   - app: Application instance to use when searching for keyboard to avoid.
    /// - Returns: Scrollable are of the element.
    func scrollableArea(avoid viewsToAviod: [AvoidableElement] = [.keyboard, .navigationBar], from app: XCUIApplication = XCUIApplication()) -> CGRect {
        var scrollableArea = frame

        viewsToAviod.forEach {
            scrollableArea = $0.overlapReminder(of: scrollableArea, in: app)
        }
        assert(scrollableArea.height > 0, "Scrollable view is completely hidden.")
        return scrollableArea
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

// MARK: - SwipeDirection
/// Swipe direction.
///
/// - `up`: Swipe up.
/// - `down`: Swipe down.
/// - `left`: Swipe to the left.
/// - `right`: Swipe to the right.
public enum SwipeDirection {
    /// Swipe up.
    case up
    /// Swipe down.
    case down
    /// Swipe to the left.
    case left
    /// Swipe to the right.
    case right
}
