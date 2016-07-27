//
//  ApplicationsFactory.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 03/06/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import AutoMate

struct ApplicationsFactory {
    static var cleanApplication: TestApplication {
        return TestApplication(launchArguments: [], launchEnvironment: [:])
    }

    static var configuredApplication: TestApplication {
        return TestApplication(launchArguments: ["-TestArgument", "Configuration"], launchEnvironment: ["TestRun": "true"])
    }
}

struct TestApplication: Application {
    var launchArguments: [String]
    var launchEnvironment: [String: String]
}
