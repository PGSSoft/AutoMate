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
    let app: XCUIApplication
    let device: XCUIDevice

    open var realCoordinate: XCUICoordinate {
        // Returns normalized coordinate for portrait orientation.
        if device.orientation == .portrait {
            return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        // Supports only landscape left, landscape right and upside down.
        // For all other unsupported orientations the default one is returned.
        guard device.orientation == .landscapeLeft
            || device.orientation == .landscapeRight
            || device.orientation == .portraitUpsideDown else {
            return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        _ = app.isHittable // force new UI hierarchy snapshot
        let screenPoint = referencedElement.coordinate(withNormalizedOffset: normalizedOffset).screenPoint

        // Calculate smart coordinate depending on device orientation.
        let portraitScreenPoint: CGVector
        switch device.orientation {
        case .landscapeLeft:
            portraitScreenPoint = CGVector(dx: app.frame.width - screenPoint.y, dy: screenPoint.x)
        case .landscapeRight:
            portraitScreenPoint = CGVector(dx: screenPoint.y, dy: app.frame.height - screenPoint.x)
        case .portraitUpsideDown:
            portraitScreenPoint = CGVector(dx: app.frame.width - screenPoint.x, dy: app.frame.height - screenPoint.y)
        default:
            preconditionFailure("Not supported orientation")
        }

        return app
            .coordinate(withNormalizedOffset: CGVector.zero)
            .withOffset(portraitScreenPoint)
    }

    // MARK: Initialization
    init(referencedElement: XCUIElement, normalizedOffset offset: CGVector, app: XCUIApplication = XCUIApplication(), device: XCUIDevice = XCUIDevice.shared()) {
        self.referencedElement = referencedElement
        self.normalizedOffset = offset
        self.app = app
        self.device = device
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
