//
//  SmartXCUICoordinate.swift
//  AutoMate
//
//  Created by Bartosz Janda on 11.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import XCTest
#if os(iOS)

// MARK: - SmartXCUICoordinate
/// Replacement for `XCUICoordinate` which works in portrait and landscape orientations.
///
/// `XCUICoordinate` has an open [issue](https://openradar.appspot.com/31529903). Coordinates works correctly only in portrait orientation.
/// This workaround was implemented based on [glebon](https://gist.github.com/glebon) [gist](https://gist.github.com/glebon/9b2bc64bfce0dd4299c522df16866822).
///
/// **Example:**
///
/// ```swift
/// let element = app.tableViews.element
/// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
/// ```
///
/// ```swift
/// SmartXCUICoordinate(referencedElement: element, normalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
/// ```
///
/// - Note:
///   [rdar://31529903](https://openradar.appspot.com/31529903)
///   XCUICoordinate tap() or press(forDuration:) methods work only in portrait orientation.
/// - Remark:
///   This functionality was implemented based on [glebon](https://gist.github.com/glebon) [gist](https://gist.github.com/glebon/9b2bc64bfce0dd4299c522df16866822).
/// - SeeAlso:
///   [Workaround for XCUICoordinate in landscape](https://gist.github.com/glebon/9b2bc64bfce0dd4299c522df16866822)
open class SmartXCUICoordinate {
    // MARK: Properties
    /// The element that the coordinate is based on, either directly or via the coordinate from which it was derived.
    open let referencedElement: XCUIElement

    /// Normalized offset from the elements origin position.
    open let normalizedOffset: CGVector

    /// Application object used to calculate portrait screen position.
    let app: XCUIApplication

    /// Device orientation.
    let orientation: UIDeviceOrientation

    /// Real coordinates in the portrait orientation.
    open var realCoordinate: XCUICoordinate {
        return realCoordinate(for: orientation)
    }

    // MARK: Initialization
    /// Initialize new smart coordinate with a normalized offset.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let smartCoordinate = SmartXCUICoordinate(referencedElement: element, normalizedOffset: CGVector(dx: 0.5, dy: 0.5))
    /// ```
    ///
    /// - Parameters:
    ///   - referencedElement: The element that the coordinate is based on, either directly or via the coordinate from which it was derived.
    ///   - offset: Normalized offset from the elements origin position.
    ///   - app: Application object used to calculate portrait screen position.
    ///   - orientation: Device orientation.
    public init(referencedElement: XCUIElement, normalizedOffset offset: CGVector, app: XCUIApplication = XCUIApplication(), orientation: UIDeviceOrientation = XCUIDevice.shared.orientation) {
        self.referencedElement = referencedElement
        self.normalizedOffset = offset
        self.app = app
        self.orientation = orientation
    }

    // MARK: Methods
    /// Calculates real coordinates in the portrait orientation.
    ///
    /// - Parameter orientation: Device orientation.
    /// - Returns: real coordinates in the portrait orientation.
    func realCoordinate(for orientation: UIDeviceOrientation) -> XCUICoordinate {
        // Returns normalized coordinate for portrait orientation.
        if orientation == .portrait {
            return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        // Returns portrait coordinates for an application element type.
        if referencedElement.elementType == .application {
            return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        // Supports only landscape left, landscape right and upside down.
        // For all other unsupported orientations the default one is returned.
        guard orientation == .landscapeLeft
            || orientation == .landscapeRight
            || orientation == .portraitUpsideDown else {
                return referencedElement.coordinate(withNormalizedOffset: normalizedOffset)
        }

        _ = app.isHittable // force new UI hierarchy snapshot
        let screenPoint = referencedElement.coordinate(withNormalizedOffset: normalizedOffset).screenPoint

        // Calculate smart coordinate depending on device orientation.
        let portraitScreenPoint: CGVector
        switch orientation {
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

    // MARK: XCUICoordinate methods
    /// Sends a tap event at the coordinate.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
    /// ```
    ///
    /// - Remark:
    ///  Wrapped `XCUICoordinate` method.
    open func tap() {
        realCoordinate.tap()
    }

    /// Sends a double tap event at the coordinate.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).doubleTap()
    /// ```
    ///
    /// - Remark:
    ///  Wrapped `XCUICoordinate` method.
    open func doubleTap() {
        realCoordinate.doubleTap()
    }

    /// Sends a long press gesture at the coordinate, holding for the specified duration.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).press(forDuration: 2)
    /// ```
    ///
    /// - Remark:
    ///  Wrapped `XCUICoordinate` method.
    ///
    /// - Parameter duration: Holding duration.
    open func press(forDuration duration: TimeInterval) {
        realCoordinate.press(forDuration: duration)
    }

    /// Initiates a press-and-hold gesture at the coordinate, then drags to another coordinate.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).press(forDuration: 1, thenDragTo: otherCoordinate)
    /// ```
    ///
    /// - Remark:
    ///  Wrapped `XCUICoordinate` method.
    ///
    /// - Parameters:
    ///   - duration: Holding duration.
    ///   - otherCoordinate: Coordinate to drag to.
    open func press(forDuration duration: TimeInterval, thenDragTo otherCoordinate: XCUICoordinate) {
        realCoordinate.press(forDuration: duration, thenDragTo: otherCoordinate)
    }

    /// Initiates a press-and-hold gesture at the coordinate, then drags to another coordinate.
    ///
    /// **Example:**
    ///
    /// ```swift
    /// let element = app.tableViews.element
    /// element.smartCoordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).press(forDuration: 1, thenDragTo: otherCoordinate)
    /// ```
    ///
    /// - Remark:
    ///  Wrapped `XCUICoordinate` method.
    ///
    /// - Parameters:
    ///   - duration: Holding duration.
    ///   - otherCoordinate: Coordinate to drag to.
    open func press(forDuration duration: TimeInterval, thenDragTo otherCoordinate: SmartXCUICoordinate) {
        realCoordinate.press(forDuration: duration, thenDragTo: otherCoordinate.realCoordinate)
    }
}
#endif
