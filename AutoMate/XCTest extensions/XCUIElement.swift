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
    public var isVisible: Bool {
        // Workaround for some situations.
        XCUIDevice.shared().orientation = .unknown
        return exists && isHittable
    }

    // MARK: Methods
    /**
     Perform swipe gesture on this view by swiping between provided points.

     - parameter startVector: Relative point from which to start swipe.
     - parameter stopVector: Relative point to end swipe.
     */
    public func swipe(from startVector: CGVector, to stopVector: CGVector) {
        let p1 = coordinate(withNormalizedOffset: startVector)
        let p2 = coordinate(withNormalizedOffset: stopVector)
        p1.press(forDuration: 0.1, thenDragTo: p2)
    }

    /**
     Swipe scroll view to reveal given element.

     - note: This method assumes that self is scrollable and at least partially visible on the screen.
     - parameter element: Element to scroll to.
     - parameter avoidKeyboard: Indicates if element should be swiped out of keyboard frame
     - parameter app: Application instance to use when searching for keyboard to avoid
     */
    public func swipe(to element: XCUIElement, avoidKeyboard: Bool = true, from app: XCUIApplication = XCUIApplication()) {
        let swipeLength: CGFloat = 0.9
        var scrollableArea = frame

        if avoidKeyboard {
            // adjust scrollable area by substracting keyboard overlap
            let keyboard = app.keyboards.element
            if keyboard.exists {
                let keyboardTop = keyboard.frame.minY
                let overlap = max(frame.maxY - keyboardTop, 0)
                scrollableArea = frame.divided(atDistance: overlap, from: .maxYEdge).remainder
                assert(frame.minY < keyboardTop, "Scrollable view is completely hidden behind keyboard.")
            }
        }

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
    public func clearTextField() {
        var previousValueLength = 0
        while let value = self.value as? NSString, value.length != previousValueLength {
            // keep removing characters until text is empty, or removing them is not allowed
            previousValueLength = value.length
            typeText("\u{8}")
        }
    }

    /**
     Remove text from textField and enter new value.

     - parameter text: Text to type after clearing old value.
     */
    public func clear(andType text: String) {
        tap()
        clearTextField()
        typeText(text)
    }

    /**
     Tap element with given offset. By default taps in the upper left corner (dx=0, dy=0).
     Tap point is calculated by adding the offset multiplied by the size of the element’s frame to the origin of the element’s frame.
     So the correct values are from range: <0, 1>.

     - parameter offset: Tap offset. Default (0, 0).
     */
    public func tap(withOffset offset: CGVector = CGVector.zero) {
        coordinate(withNormalizedOffset: offset).tap()
    }

    /**
     Dismiss system alert by tapping "Don't allow" (when possible).

     - note: This method exists because system alerts do not provide accessibility identifiers. Therefore to support different languages,
     it's necessary to try all localized variants.
     - note: In Xcode 7 there is a bug preventing `addUIInterruptionMonitorWithDescription` from working when multiple system alerts appear.
     It has been fixed in Xcode 8.
     */
    public func tapLeftButtonOnSystemAlert() {
        let labels = SystemAlertLabel.dontAllow + SystemAlertLabel.ok
        for buttonLabel in labels {
            let button = buttons[buttonLabel]
            if button.exists {
                button.tap()
                return
            }
        }
    }
}
