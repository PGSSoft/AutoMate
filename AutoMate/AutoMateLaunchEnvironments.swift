//
//  AutoMateLaunchEnvironments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - AutoMateLaunchEnvironment
// TODO: Update app companion data when available.
/// Protocol adapted by all LaunchEnviroment options predefined in AutoMate.
/// It also assures that default handling is provided by [AutoMate - App Compation](https://github.com/PGSSoft/AutoMate-...)
public protocol AutoMateLaunchEnvironment {
    // MARK: Properties
    static var key: AutoMateKey { get }
}

public extension AutoMateLaunchEnvironment where Self: LaunchEnvironmentWithMultipleValues, Self.Value == LaunchEnvironmentResourceValue {

    // MARK: Properties
    public var uniqueIdentifier: String {
        return Self.key.rawValue
    }

    // MARK: Initialization
    public init(resources: (fileName: String, bundleName: String?)...) {
        self.init(valuesCollection: resources.map(Value.init))
    }
}

public extension AutoMateLaunchEnvironment where Self: LaunchEnvironmentWithSingleValue {

    // MARK: Properties
    public var key: String {
        return Self.key.rawValue
    }
}

// MARK: - Event Launch Environment
/// Launch environment supporting EventKit events. Expects bundle and file name for every file containing data of events to be added into calendar at test launch. Structure is defined in example project's file _events.json_.
/// Usage example:
///
/// ```swift
/// let recurringEvents: EventLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "monthly_events", bundleName: "Data") ]
/// let nearEvents = EventLaunchEnvironment(resources: (fileName: "todays_events", bundleName: "Test data"), (fileName: "this_week_events", bundleName: nil))
public struct EventLaunchEnvironment: LaunchEnvironmentWithMultipleValues, AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = LaunchEnvironmentResourceValue

    // MARK: Properties
    public static let key: AutoMateKey = .events
    public let valuesCollection: [Value]

    // MARK: Initialization
    public init(valuesCollection: [Value]) {
        self.valuesCollection = valuesCollection
    }
}

// MARK: - Reminder Launch Environment
/// Launch environment supporting EventKit reminders. Expects bundle and file name for every file containing data of reminders to be added into calendar at test launch. Structure is defined in example project's file _reminders.json_.
/// Usage example:
///
/// ```swift
/// let recurringReminders: ReminderLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "johnys_birthday_reminder", bundleName: "Data") ]
/// let highPriorityReminders = ReminderLaunchEnvironment(resources: (fileName: "automate_release_reminders", bundleName: "Test data"), (fileName: "wwdc_reminders", bundleName: nil))
public struct ReminderLaunchEnvironment: LaunchEnvironmentWithMultipleValues, AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = LaunchEnvironmentResourceValue

    // MARK: Properties
    public static let key: AutoMateKey = .reminders
    public let valuesCollection: [LaunchEnvironmentResourceValue]

    // MARK: Initialization
    public init(valuesCollection: [LaunchEnvironmentResourceValue]) {
        self.valuesCollection = valuesCollection
    }
}

// MARK: - Contacts Launch Environment
/// Launch environment supporting Contacts. Expects bundle and file name for every file containing data of contacts to be added into address book at test launch.
/// Structure is defined in example project's file _contacts.json_.
/// Usage example:
///
/// ```swift
/// let johnContacts: ContactLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "john", bundleName: "Data") ]
/// let severalContacts = ContactLaunchEnvironment(resources: (fileName: "michael", bundleName: "Test data"), (fileName: "emma", bundleName: nil))
public struct ContactLaunchEnvironment: LaunchEnvironmentWithMultipleValues, AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = LaunchEnvironmentResourceValue

    // MARK: Properties
    public static let key: AutoMateKey = .contacts
    public let valuesCollection: [LaunchEnvironmentResourceValue]

    // MARK: Initialization
    public init(valuesCollection: [LaunchEnvironmentResourceValue]) {
        self.valuesCollection = valuesCollection
    }
}

// MARK: - Turn off animation launch environment
/// Launch environment disabling UIKit animation.
/// Usage example:
///
/// ```swift
/// let disableAnimation = AnimationLaunchEnvironment()
/// ```
public struct AnimationLaunchEnvironment: LaunchEnvironmentWithSingleValue, AutoMateLaunchEnvironment {

    // MARK: Typealiases
    public typealias Value = BooleanLaunchEnvironmentValue

    // MARK: Properties
    public static let key: AutoMateKey = .animation
    public var value: Value

    // MARK: Initialization
    /// Initialize launch option. By default disable animation (`false`).
    ///
    /// - Parameter animation: `false` (default) if animation should be disabled.
    public init(animation: Value = false) {
        value = animation
    }
}
