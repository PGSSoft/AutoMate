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
    static let multiSoftwareKeyboardLaunchArgument = SoftwareKeyboards([.EnglishUnitedStates, .ChineseChinamainland])
    static let singleLanguageLaunchArgument = SystemLanguages([.EnglishUnitedStates])
    static let multiLanguageLaunchArgument = SystemLanguages([.EnglishUnitedStates, .Hungarian])

    static let pgsWithLoveLaunchEnvironment = LaunchEnvironment(key: "MADE_WITH_LOVE_BY", value: "PGS")
    static let frameworkLaunchEnvironment = LaunchEnvironment(key: "FRAMEWORK", value: "Automate")

    static let goalsLaunchEnvironments: LaunchEnvironments = ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"]
    static let accomplishedLaunchEnvironments: LaunchEnvironments = ["SAVED_TIME": "of_developers_for_coffee", "MADE_SMILE": "qa_specialists"]

    static let thisWeekEventsLaunchEnvironment: EventLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "this_week", bundleName: nil)]
    static let futureEventsLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: true, resources: ("next_week", "Resources"), ("recurring_monthly", nil))
    static let deleteEventsLaunchEnvironment = EventLaunchEnvironment(shouldCleanBefore: true)

    static let turnOffAnimationLaunchEnvironment = AnimationLaunchEnvironment()
    static let turnOnAnimationLaunchEnvironment = AnimationLaunchEnvironment(animation: true)

    static let isInUiTestLaunchEnvironment = IsInUITestLaunchEnvironment()
    static let notInUiTestLaunchEnvironment = IsInUITestLaunchEnvironment(inUITest: false)

    static let recurringReminderLaunchEnvironment: ReminderLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "johnys_birthday_reminder", bundleName: "Data")]
    static let highPriorityReminderLaunchEnvironment = ReminderLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "automate_release_reminders", bundleName: "Test data"), (fileName: "wwdc_reminders", bundleName: nil))
    static let deleteReminderLaunchEnvironment = ReminderLaunchEnvironment(shouldCleanBefore: true)

    static let johnContacts: ContactLaunchEnvironment = [ LaunchEnvironmentResourceValue(fileName: "john", bundleName: "Data") ]
    static let severalContacts = ContactLaunchEnvironment(shouldCleanBefore: true, resources: (fileName: "michael", bundleName: "Test data"), (fileName: "emma", bundleName: nil))
    static let deleteContacts = ContactLaunchEnvironment(shouldCleanBefore: true)
}
