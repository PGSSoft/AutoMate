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

    static let pgsWithLoveLaunchEnviroment = LaunchEnviroment(key: "MADE_WITH_LOVE_BY", value: "PGS")
    static let frameworkLaunchEnviroment = LaunchEnviroment(key: "FRAMEWORK", value: "Automate")

    static let goalsLaunchEnviroments: LaunchEnviroments = ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"]
    static let accomplishedLaunchEnviroments: LaunchEnviroments = ["SAVED_TIME": "of_developers_for_coffee", "MADE_SMILE": "qa_specialists"]

    static let thisWeekEventsLaunchEnviroment: EventLaunchEnviroment = [ LaunchEnviromentResourceValue(fileName: "this_week", bundleName: nil)]
    static let futureEventsLaunchEnviroment = EventLaunchEnviroment(resources: ("next_week", "Resources"), ("recurring_monthly", nil))

}
