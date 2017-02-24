//
//  AppDelegate.swift
//  AutoMateExample
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var launchOptionsHandler: LaunchOptionsHandler!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        launchOptionsHandler = LaunchOptionsHandler()
        launchOptionsHandler.setup()
        return true
    }
}
