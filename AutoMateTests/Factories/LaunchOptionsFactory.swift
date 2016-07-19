//
//  LaunchOptionsFactory.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import AutoMate

struct LaunchOptionsFactory {

    static var singleSoftwareKeyboardArgument: KeyboardArgument {
        return SystemSoftwareKeyboardArgument([.EnglishUnitedStates])
    }

    static var multiSoftwareKeyboardArgument: KeyboardArgument {
        return SystemSoftwareKeyboardArgument([.EnglishUnitedStates, .ChineseChina])
    }

    static var singleLanguageArgument: LanguageArgument {
        return SystemLanguageArgument([.EnglishUnitedStates])
    }

    static var multiLanguageArgument: LanguageArgument {
        return SystemLanguageArgument([.EnglishUnitedStates, .Hungarian])
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
