//
//  PermissionsSubViews.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - ContactsPage
open class ContactsPage: BaseAppPage, PushedPage {}

// MARK: - HealthKitPage
open class HealthKitPage: BaseAppPage, PushedPage { }

// MARK: - HomeKitPage
open class HomeKitPage: BaseAppPage, PushedPage { }

// MARK: - LocationPage
open class LocationPage: BaseAppPage, PushedPage {
    // MARK: Elements
    open var requestLabel: XCUIElement {
        return view.staticTexts[Locators.requestLabel]
    }

    // MARK: Locators
    private enum Locators: String, Locator {
        case requestLabel
    }
}

// MARK: - SpeechRecognitionPage
open class SpeechRecognitionPage: BaseAppPage, PushedPage {}

// MARK: - SiriPage
open class SiriPage: BaseAppPage, PushedPage {}

// MARK: - RemindersPage
open class RemindersPage: BaseAppPage, PushedPage {}

// MARK: - PhotosPage
open class PhotosPage: BaseAppPage, PushedPage {}

// MARK: - CameraPage
open class CameraPage: BaseAppPage, PushedPage {}

// MARK: - MediaLibraryPage
open class MediaLibraryPage: BaseAppPage, PushedPage {}

// MARK: - BluetoothPage
open class BluetoothPage: BaseAppPage, PushedPage {}

// MARK: - MicrophonePage
open class MicrophonePage: BaseAppPage, PushedPage {}

// MARK: - CallsPage
open class CallsPage: BaseAppPage, PushedPage {}

// MARK: - CalendarPage
open class CalendarPage: BaseAppPage, PushedPage {}

// MARK: - MotionPage
open class MotionPage: BaseAppPage, PushedPage {}
