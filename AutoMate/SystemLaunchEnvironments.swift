//
//  SystemLaunchEnvironments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Environment Resource Value
/// Launch environment resource model containing informations required to point proper file containing resource data. Expects bundle and file name. If bundle name is `nil` main bundle will be searched.
///
/// ```swift
/// let resource = LaunchEnvironmentResourceValue(fileName: "monthly_events", bundleName: "Data")
public struct LaunchEnvironmentResourceValue: LaunchEnvironmentValue {

    // MARK: Properties
    public let file: String
    public let bundle: String?

    public var value: String {
        return "\(bundle ?? "nil"):\(file)"
    }

    // MARK: Initialization
    public init(fileName file: String, bundleName bundle: String? = nil) {
        self.file = file
        self.bundle = bundle
    }
}

// MARK: - Event Launch Environment
/// Launch environment supporting EventKit events. Expects bundle and file name for every file containing data of events to be added into calendar at test launch. Structure is defined in example project's file _events.json_.
/// Usage example:
///
/// ```swift
/// let recurringEvents: EventLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "monthly_events", bundleName: "Data") ]
/// let nearEvents = EventLaunchEnvironment(resources: (fileName: "todays_events", bundleName: "Test data"), (fileName: "this_week_events", bundleName: nil))
public struct EventLaunchEnvironment: AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = LaunchEnvironmentResourceValue

    // MARK: Properties
    public static var key: AutoMateKey = .event
    public let valuesCollection: [Value]

    // MARK: Initialization
    public init(valuesCollection: [Value]) {
        self.valuesCollection = valuesCollection
    }
}

public protocol AutoMateLaunchEnvironment: LaunchEnvironmentWithMultipleValues {

    static var key: AutoMateKey { get }
}

extension AutoMateLaunchEnvironment {

    public var uniqueIdentifier: String {
        return Self.key.rawValue
    }
}

extension AutoMateLaunchEnvironment where Value == LaunchEnvironmentResourceValue {

    public init(resources: (fileName: String, bundleName: String?)...) {
        self.init(valuesCollection: resources.map(Value.init))
    }
}

public struct ReminderLaunchEnvironment: AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = LaunchEnvironmentResourceValue

    // MARK: Properties
    public static var key: AutoMateKey = .reminder
    public let valuesCollection: [LaunchEnvironmentResourceValue]

    // MARK: Initialization
    public init(valuesCollection: [LaunchEnvironmentResourceValue]) {
        self.valuesCollection = valuesCollection
    }
}

public enum AutoMateKey: String {
    case event = "AM_EVENTS_KEY"
    case reminder = "AM_REMINDERS_KEY"
}

// MARK: - Turn off animation launch environment
/// Launch environment disabling UIKit animation.
/// Usage example:
///
/// ```swift
/// let disableAnimation = AnimationLaunchEnvironment()
/// ```
public struct AnimationLaunchEnvironment: LaunchEnvironmentWithSingleValue {

    // MARK: Typealiases
    public typealias Value = BooleanLaunchEnvironmentValue

    // MARK: Properties
    public let key = "AM_ANIMATION_KEY"
    public var value: Value

    // MARK: Initialization
    /// Initialize launch option. By default disable animation (`false`).
    ///
    /// - Parameter animation: `false` (default) if animation should be disabled.
    public init(animation: Value = false) {
        value = animation
    }
}

