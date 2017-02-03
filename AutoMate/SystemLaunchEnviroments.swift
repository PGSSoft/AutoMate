//
//  SystemLaunchEnviroments.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 26/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: - Launch Enviroment Resource Value
/// Launch enviroment resource model containing informations required to point proper file containing resource data. Expects bundle and file name. If bundle name is `nil` main bundle will be searched.
///
/// ```swift
/// let resource = LaunchEnviromentResourceValue(fileName: "monthly_events", bundleName: "Data")
public struct LaunchEnviromentResourceValue: LaunchEnviromentValue {

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

// MARK: - Event Launch Enviroment
/// Launch enviroment supporting EventKit events. Expects bundle and file name for every file containing data of events to be added into calendar at test launch. Structure is defined in example project's file _events.json_. 
/// Usage example:
///
/// ```swift
/// let recurringEvents: EventLaunchEnviroment = [ LaunchEnviromentResourceValue(fileName: "monthly_events", bundleName: "Data") ]
/// let nearEvents = EventLaunchEnviroment(resources: (fileName: "todays_events", bundleName: "Test data"), (fileName: "this_week_events", bundleName: nil))
public struct EventLaunchEnviroment: LaunchEnviromentWithMultipleValues {

    // MARK: Typealiases
    public typealias Value = LaunchEnviromentResourceValue

    // MARK: Properties
    public let key = "AM_EVENTS_KEY"
    public private(set) var valuesCollection: [Value]

    public var uniqueIdentifier: String {
        return key
    }

    // MARK: Initialization
    public init(valuesCollection: [Value]) {
        self.valuesCollection = valuesCollection
    }

    public init(resources: (fileName: String, bundleName: String?)...) {
        self.valuesCollection = resources.map(LaunchEnviromentResourceValue.init)
    }
}

// MARK: - Turn off animation launch environment
public struct AnimationLaunchEnvironment: LaunchEnviromentProtocol {

    // MARK: Typealiases
    public typealias Value = BooleanLaunchEnviromentValue

    // MARK: Properties
    private static let KEY = "AM_ANIMATION_KEY"
    public let key = AnimationLaunchEnvironment.KEY
    public let uniqueIdentifier = AnimationLaunchEnvironment.KEY
    public var value: Value

    // MARK: Initialization
    public init(animation: Value = false) {
        value = animation
    }

    // MARK: LaunchOption
    public var launchEnvironments: [String : String]? {
        return [key: value.value]
    }
}
