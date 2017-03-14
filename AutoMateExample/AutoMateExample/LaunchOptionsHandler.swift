//
//  LaunchOptionsHandler.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 24/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import AutoMate_AppBuddy

// MARK: - LaunchOptionsHandler
struct LaunchOptionsHandler {

    // MARK: Properties
    let launchEnvironmentManager: LaunchEnvironmentManager

    // MARK: Initialization
    init() {
        launchEnvironmentManager = LaunchEnvironmentManager()
        launchEnvironmentManager.add(handler: defaultEventKitHander, for: .reminders)
        launchEnvironmentManager.add(handler: defaultEventKitHander, for: .events)
        launchEnvironmentManager.add(handler: defaultContactsHander, for: .contacts)
        launchEnvironmentManager.add(handler: AnimationHandler(), for: .animation)
    }

    // MARK: Methods
    func setup() {
        launchEnvironmentManager.setup()
    }

    // MARK: Fake launch enviroments
    private static let mockEnvironment: [String: String] = {
        return [ AutoMateLaunchOptionKey.events.rawValue: "TestResourceBundle:events",
            AutoMateLaunchOptionKey.reminders.rawValue: "TestResourceBundle:reminders",
            AutoMateLaunchOptionKey.contacts.rawValue: "TestResourceBundle:contacts"]
    }()
}
