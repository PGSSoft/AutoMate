//
//  XCUIElement.swift
//  AutoMate
//
//  Created by Pawel Szot on 02/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import Foundation
import XCTest

/// Represents available types of devices.
public enum DeviceType {
    /// Enum value corresponding to device screen size.
    case iPhone35, iPhone40, iPhone47, iPhone55, iPad, iPadPro
}

public extension XCUIApplication {

    // MARK: Properties
    /**
     Type of current device, based on running's app window size.
     - note: iPhone6 and iPhone6+ have "Zoom" feature, which will make the resultion smaller. In this case iPhone6 would appear as iPhone 5,
     and iPhone6+ as iPhone 6.
     */
    public var deviceType: DeviceType {
        let window = windows.elementBoundByIndex(0)
        let size = window.frame.size
        let portraitSize = size.height > size.width ? size : CGSize(width: size.height, height: size.width)

        switch (round(portraitSize.width), round(portraitSize.height)) {
        case (320, 480):
            return .iPhone35
        case (320, 568):
            return .iPhone40
        case (375, 667):
            return .iPhone47
        case (414, 736):
            return .iPhone55
        case (768, 1024):
            return .iPad
        case (1024, 1365..<1367):
            return .iPadPro
        default:
            fatalError("Unrecognized device type")
        }
    }

    /// A Boolean value indicating whether app is currently running on iPad.
    public var isRunningOnIpad: Bool {
        switch deviceType {
        case .iPad, .iPadPro:
            return true
        case .iPhone35, .iPhone40, .iPhone47, .iPhone55:
            return false
        }
    }

    /// A Boolean value indicating whether app is currently running on iPhone.
    public var isRunningOnIphone: Bool {
        switch deviceType {
        case .iPad, .iPadPro:
            return false
        case .iPhone35, .iPhone40, .iPhone47, .iPhone55:
            return true
        }
    }

    /// A Boolean value indicating whether app is currently running on simulator.
    public var isRunningOnSimulator: Bool {
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            return true
        #else
            return false
        #endif
    }

    /// Returns machine identifier string in a form of "name,major,minor", i.e. "iPhone,8,2".
    private var machineIdentifier: String {
        if isRunningOnSimulator {
            guard let value = NSProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] else {
                fatalError("Failed to determine simulator type.")
            }
            return value
        }

        var systemInfo = utsname()
        uname(&systemInfo)
        let value = withUnsafePointer(&systemInfo.machine) {
            String.fromCString(UnsafePointer($0))!
        }
        return value
    }

    /// Type of current device, ignoring "Zoom" feature.
    public var actualDeviceType: DeviceType {
        // determine device type by checking machineIdentifier directly
        switch machineIdentifier {
        case "iPhone7,1", "iPhone8,2":
            return .iPhone55
        case "iPhone7,2", "iPhone8,1":
            return .iPhone47
        default:
            return deviceType
        }
    }

    // MARK: Methods
    /**
     Checks if current device is of provided type.
     - parameter deviceType: type of device to check for.
     - returns: Boolean value indicating whether current device is of the expected type.
     */
    public func isRunningOn(deviceType: DeviceType) -> Bool {
        return self.deviceType == deviceType
    }
}
