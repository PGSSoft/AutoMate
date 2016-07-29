//
//  LaunchOptionsFactory.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import AutoMate

struct LaunchOptionsFactory {

    static var singleSoftwareKeyboardLaunchArgument: KeyboardLaunchArgument {
        return SoftwareKeyboards([.EnglishUnitedStates])
    }

    static var multiSoftwareKeyboardLaunchArgument: KeyboardLaunchArgument {
        return SoftwareKeyboards([.EnglishUnitedStates, .ChineseChina])
    }

    static var singleLanguageLaunchArgument: LanguageLaunchArgument {
        return SystemLanguages([.EnglishUnitedStates])
    }

    static var multiLanguageLaunchArgument: LanguageLaunchArgument {
        return SystemLanguages([.EnglishUnitedStates, .Hungarian])
    }

    static var testLaunchEnviromentOption: LaunchOption {
        return TestLaunchEnviromentOption()
    }
}

struct TestLaunchEnviromentOption: LaunchOption {

    var launchEnvironments: [String: String]? {
        return [
            "TestKey": "TestConfiguration"
        ]
    }
}
