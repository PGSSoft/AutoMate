//
//  XCUIElement.swift
//  AutoMate
//
//  Created by PSZOT on 29/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

public extension XCUIElement {
    /**
     Perform swipe gesture on this view by swiping between provided points.

     - parameter startVector: Relative point from which to start swipe
     - parameter stopVector: Relative point to end swipe.
     */
    public func swipe(from startVector: CGVector, to stopVector: CGVector) {
        let p1 = self.coordinateWithNormalizedOffset(startVector)
        let p2 = self.coordinateWithNormalizedOffset(stopVector)
        p1.pressForDuration(0.1, thenDragToCoordinate: p2)
    }

    /**
     Performs swipe gestures to scroll to descendant element that may be hidden under keyboard. If swiping doesn't change anything it stops.
     This method assumes that the top portion of the self is currently visible.

     - parameter element: descendant to scroll to.
     - parameter avoidKeyboard: indicates if element should be scrolled out of the keyboard frame
     */
    public func swipe(to element: XCUIElement, avoidKeyboard: Bool = true) {
        let swipeLength: CGFloat = 0.9
        var scrollableArea = frame

        if avoidKeyboard {
            //adjust scrollable area by substracting keyboard overlap
            let keyboard = XCUIApplication().keyboards.element
            if keyboard.exists {
                let keyboardTop = keyboard.frame.minY
                let overlap = max(frame.maxY-keyboardTop, 0)
                scrollableArea = frame.divide(overlap, fromEdge: .MaxYEdge).remainder
                assert(frame.minY < keyboardTop, "Scrollable view is completely hidden behind keyboard.")
            }
        }

        func scroll(deltaY: CGFloat, @noescape condition:() -> (Bool)) {
            var oldElementFrame = element.frame
            while condition() {
                //calculate swipe points so that they fit into scrollabel area
                let offset = scrollableArea.height / frame.height * (deltaY / 2)
                let center = scrollableArea.height / 2 / frame.height

                swipe(from: CGVector(dx:0.5, dy:center+offset), to: CGVector(dx:0.5, dy:center-offset))
                guard oldElementFrame != element.frame else {
                    break
                }
                oldElementFrame = element.frame
            }
        }

        scroll(swipeLength) { element.frame.maxY > scrollableArea.maxY }
        scroll(-swipeLength) { element.frame.minY < scrollableArea.minY }

        assert(scrollableArea.contains(element.frame), "Failed to reveal element.")
    }

    /**
     Clear the value inside text field by tapping on keyboard "delete" button. Works with "textFields" and "secureTextFields"
     */
    public func clearTextField() {
        let app = XCUIApplication()
        let deleteButton = app.keys.elementMatchingType(XCUIElementType.Key, identifier: "delete")
        var previousValueLength = 0
        while let value = self.value as? NSString where value.length != previousValueLength {
            previousValueLength = value.length
            deleteButton.tap()
        }
    }

    /**
     Clear the value in text field and type new text inside.

     - parameter text: text to enter in text field.
     */
    public func clearTextFieldAndTypeText(text: String) {
        self.tap()
        self.clearTextField()
        self.typeText(text)
    }

    /**
     Tap element with given offset. By default taps in the upper left corner (dx=0, dy=0).
     Tap point is calculated by adding the offset multiplied by the size of the element’s frame to the origin of the element’s frame.
     So the correct values are from range: <0, 1>.

     - parameter offset: Tap offset. Default (0, 0).
     */
    public func tapWithOffset(offset: CGVector = CGVector.zero) {
        self.coordinateWithNormalizedOffset(offset).tap()
    }

    /**
     For system alerts it is not possible to add accessibility identifier. Labels can be used but they might vary depends on system language.
     Method tapLeftButtonOnSystemAlert handles different lables. As for 29.01.2016, english, german and polish versions are supported.

     "OK" is added to tabel of labels because as for Xcode 7.2 there is no chance to handle multiple alerts that are displayed ater each other.
     In the app, when user disallow the access to location, a second alert is shown right away, before handler is removed. So this "hack" dismiss
     second alert.
     */
    public func tapLeftButtonOnSystemAlert() {
        var leftButton = self.buttons["Don’t Allow"]
        let localisedLeftButtonLabels = ["Nein", "Nie pozwalaj", "OK"]

        if !leftButton.exists {
            for btnLabel in localisedLeftButtonLabels {
                leftButton = self.buttons[btnLabel]
                if leftButton.exists {
                    break
                }
            }
        }
        leftButton.tap()
    }

    /**
     Indicates if the element is currently visible on the screen.
     */
    public var isVisible: Bool {
        /**
         The call bellow, does a rotation to unknown orientation - it has no effect in the app, but is enough to prevent a UIAutomation error.
         This error is caused by the framework - checking for any property from XCUIElement does not (oppose to any action on element like tap()) trigger
         wait for the end of any UI related operations. Thus in test an element might be expected but is not yet shown.
         */
        XCUIDevice.sharedDevice().orientation = .Unknown
        return exists && hittable
    }
}
