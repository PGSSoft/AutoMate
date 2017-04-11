//
//  SmartXCUICoordinate.swift
//  AutoMate
//
//  Created by Bartosz Janda on 11.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest

// MARK: - SmartXCUICoordinate
open class SmartXCUICoordinate
{
    // MARK: Properties
    open let referencedElement: XCUIElement
    open let normalizedOffset: CGVector

    open var realCoordinate: XCUICoordinate {
        guard XCUIDevice.shared().orientation.isLandscape else {
            return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        let app = XCUIApplication()
        _ = app.isHittable // force new UI hierarchy snapshot
        let screenPoint = referencedElement.coordinate(withNormalizedOffset: normalizedOffset).screenPoint

        let portraitScreenPoint = XCUIDevice.shared().orientation == .landscapeLeft
            ? CGVector(dx: app.frame.width - screenPoint.y, dy: screenPoint.x)
            : CGVector(dx: screenPoint.y, dy: app.frame.height - screenPoint.x)

        return app
            .coordinate(withNormalizedOffset: CGVector.zero)
            .withOffset(portraitScreenPoint)
    }

    // MARK: Initialization
    init(referencedElement: XCUIElement, normalizedOffset offset: CGVector) {
        self.referencedElement = referencedElement
        self.normalizedOffset = offset
    }

    // MARK: XCUICoordinate methods
    open func tap() {
        realCoordinate.tap()
    }

    open func doubleTap() {
        realCoordinate.doubleTap()
    }

    open func press(forDuration duration: TimeInterval) {
        realCoordinate.press(forDuration: duration)
    }

    open func press(forDuration duration: TimeInterval, thenDragTo otherCoordinate: XCUICoordinate) {
        realCoordinate.press(forDuration: duration, thenDragTo: otherCoordinate)
    }

    open func press(forDuration duration: TimeInterval, thenDragTo otherCoordinate: SmartXCUICoordinate) {
        realCoordinate.press(forDuration: duration, thenDragTo: otherCoordinate.realCoordinate)
    }
}
