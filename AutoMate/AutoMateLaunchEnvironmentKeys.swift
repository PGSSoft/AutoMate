//
//  AutoMateLaunchEnvironmentKeys.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 10/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

/// Set of LaunchEnvironment keys for predefined options implemented by AutoMate.
///
/// - event: Key to pass with EventLaunchEnvironment.
/// - reminder: Key to pass with ReminderLaunchEnvironment.
/// - animation: Key to pass with AnimationLaunchEnvironment.
public enum AutoMateKey: String {
    case event = "AM_EVENTS_KEY"
    case reminder = "AM_REMINDERS_KEY"
    case animation = "AM_ANIMATION_KEY"
}
