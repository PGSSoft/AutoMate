//
//  LaunchOptionsFactory.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import AutoMate

enum LaunchOptionsFactory {

    static let singleSoftwareKeyboardLaunchArgument = SoftwareKeyboards([.EnglishUnitedStates])
    static let multiSoftwareKeyboardLaunchArgument = SoftwareKeyboards([.EnglishUnitedStates, .ChineseChina])
    static let singleLanguageLaunchArgument = SystemLanguages([.EnglishUnitedStates])
    static let multiLanguageLaunchArgument = SystemLanguages([.EnglishUnitedStates, .Hungarian])

    static let pgsWithLoveLaunchEnvironment = LaunchEnvironment(key: "MADE_WITH_LOVE_BY", value: "PGS")
    static let frameworkLaunchEnvironment = LaunchEnvironment(key: "FRAMEWORK", value: "Automate")

    static let goalsLaunchEnvironments: LaunchEnvironments = ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"]
    static let accomplishedLaunchEnvironments: LaunchEnvironments = ["SAVED_TIME": "of_developers_for_coffee", "MADE_SMILE": "qa_specialists"]

    static let thisWeekEventsLaunchEnvironment: EventLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "this_week", bundleName: nil)]
    static let futureEventsLaunchEnvironment = EventLaunchEnvironment(resources: ("next_week", "Resources"), ("recurring_monthly", nil))

    static let turnOffAnimationLaunchEnvironment = AnimationLaunchEnvironment()
    static let turnOnAnimationLaunchEnvironment = AnimationLaunchEnvironment(animation: true)

    static let recurringReminderLaunchEnvironment: ReminderLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "johnys_birthday_reminder", bundleName: "Data")]
    static let highPriorityReminderLaunchEnvironment = ReminderLaunchEnvironment(resources: (fileName: "automate_release_reminders", bundleName: "Test data"), (fileName: "wwdc_reminders", bundleName: nil))
}
