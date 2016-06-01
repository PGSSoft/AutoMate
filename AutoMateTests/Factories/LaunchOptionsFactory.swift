//
//  LaunchOptionsFactory.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/05/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import AutoMate

private enum TestLaunchArgumenValue: String, LaunchArgumentValue {
    case Value1 = "value"
}

struct LaunchOptionsFactory {

    static var keyboardArgument: KeyboardArgument {
        return KeyboardArgument([TestLaunchArgumenValue.Value1])
    }

    static var languageArgument: LanguageArgument {
        return LanguageArgument([TestLaunchArgumenValue.Value1])
    }
}
