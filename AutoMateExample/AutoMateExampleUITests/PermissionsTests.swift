//
//  PermissionsTests.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// swiftlint:disable type_body_length
class PermissionsTests: AppUITestCase {

    // MARK: Arrange Page Objects
    lazy var mainPage: MainPage = MainPage(in: self.app)
    lazy var permissionsPage: PermissionsPage = PermissionsPage(in: self.app)
    lazy var locationPage: LocationPage = LocationPage(in: self.app)
    lazy var contactsPage: ContactsPage = ContactsPage(in: self.app)
    lazy var homeKitPage: HomeKitPage = HomeKitPage(in: self.app)
    lazy var healthKitPage: HealthKitPage = HealthKitPage(in: self.app)
    lazy var healthPermissionPage: HealthPermissionPage = HealthPermissionPage(in: self.app)
    lazy var speechRecognitionPage: SpeechRecognitionPage = SpeechRecognitionPage(in: self.app)
    lazy var siriPage: SiriPage = SiriPage(in: self.app)
    lazy var remindersPage: RemindersPage = RemindersPage(in: self.app)
    lazy var photosPage: PhotosPage = PhotosPage(in: self.app)
    lazy var cameraPage: CameraPage = CameraPage(in: self.app)
    lazy var mediaLibraryPage: MediaLibraryPage = MediaLibraryPage(in: self.app)
    lazy var bluetoothPage: BluetoothPage = BluetoothPage(in: self.app)
    lazy var microphonePage: MicrophonePage = MicrophonePage(in: self.app)
    lazy var callsPage: CallsPage = CallsPage(in: self.app)
    lazy var calendarPage: CalendarPage = CalendarPage(in: self.app)
    lazy var motionPage: MotionPage = MotionPage(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainPage)
    }

    // MARK: Tests
    func locationWhenInUse() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Location") { (alert) -> Bool in
            guard let locationAlert = LocationWhenInUseAlert(element: alert) else {
                XCTFail("Cannot create LocationWhenInUseAlert object")
                return false
            }

            XCTAssertTrue(locationAlert.denyElement.exists)
            XCTAssertTrue(locationAlert.allowElement.exists)

            locationAlert.allowElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToLocationWhenInUse()
        // Interruption won't happen without some kind of action.
        app.tap()
        wait(forVisibilityOf: locationPage.requestLabel)
        locationPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func locationUpgradeToAlways() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Location") { (alert) -> Bool in
            guard let locationAlert = LocationUpgradeWhenInUseAlwaysAlert(element: alert) else {
                XCTFail("Cannot create LocationUpgradeWhenInUseAlwaysAlert object")
                return false
            }

            XCTAssertTrue(locationAlert.cancelElement.exists)
            XCTAssertTrue(locationAlert.allowElement.exists)

            locationAlert.cancelElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToLocationAlways()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testLocationSystemAlert() {
        locationWhenInUse()
        locationUpgradeToAlways()
    }

    func testContactsSystemAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Contacts") { (alert) -> Bool in
            guard let contactsAlert = AddressBookAlert(element: alert) else {
                XCTFail("Cannot create AddressBookAlert object")
                return false
            }

            XCTAssertTrue(contactsAlert.denyElement.exists)
            XCTAssertTrue(contactsAlert.allowElement.exists)

            contactsAlert.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToContacts()
        // Interruption won't happen without some kind of action.
        app.tap()
        contactsPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testHomeKitAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "HomeKit") { (alert) -> Bool in
            guard let homeKitAlert = WillowAlert(element: alert) else {
                XCTFail("Cannot create WillowAlert object")
                return false
            }

            XCTAssertTrue(homeKitAlert.denyElement.exists)
            XCTAssertTrue(homeKitAlert.allowElement.exists)

            homeKitAlert.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToHomeKit()
        // Interruption won't happen without some kind of action.
        app.tap()
        homeKitPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testHealthKitAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "HomeKit") { (alert) -> Bool in
            guard let homeKitAlert = HealthAuthorizationDontAllowAlert(element: alert) else {
                XCTFail("Cannot create HealthAuthorizationDontAllowAlert object")
                return false
            }

            XCTAssertTrue(homeKitAlert.okElement.exists)

            homeKitAlert.okElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToHealthKit()

        wait(forVisibilityOf: healthPermissionPage)
        XCTAssertTrue(healthPermissionPage.allowElement.exists)
        XCTAssertTrue(healthPermissionPage.denyElement.exists)
        XCTAssertTrue(healthPermissionPage.turnOnAllElement.exists)

        healthPermissionPage.turnOnAllElement.tap()

        XCTAssertTrue(healthPermissionPage.turnOffAllElement.exists)

        healthPermissionPage.denyElement.tap()
        app.tap()

        healthKitPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testSpeechRecognitionAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "SpeechRecognition") { (alert) -> Bool in
            guard let alertView = SpeechRecognitionAlert(element: alert) else {
                XCTFail("Cannot create SpeechRecognitionAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToSpeechRecognition()
        // Interruption won't happen without some kind of action.
        app.tap()
        speechRecognitionPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    // Doesn't work on simulator
    func testSiriAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Siri") { (alert) -> Bool in
            guard let alertView = SiriAlert(element: alert) else {
                XCTFail("Cannot create SiriAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToSiri()
        // Interruption won't happen without some kind of action.
        app.tap()
        siriPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testRemindersAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Reminders") { (alert) -> Bool in
            guard let alertView = RemindersAlert(element: alert) else {
                XCTFail("Cannot create RemindersAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToReminders()
        // Interruption won't happen without some kind of action.
        app.tap()
        remindersPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testPhotosAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Photos") { (alert) -> Bool in
            guard let alertView = PhotosAlert(element: alert) else {
                XCTFail("Cannot create PhotosAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToPhotos()
        // Interruption won't happen without some kind of action.
        app.tap()
        photosPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testCameraAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Camera") { (alert) -> Bool in
            guard let alertView = CameraAlert(element: alert) else {
                XCTFail("Cannot create CameraAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToCamera()
        // Interruption won't happen without some kind of action.
        app.tap()
        cameraPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testMediaLibraryAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "MediaLibrary") { (alert) -> Bool in
            guard let alertView = MediaLibraryAlert(element: alert) else {
                XCTFail("Cannot create MediaLibraryAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToMediaLibrary()
        // Interruption won't happen without some kind of action.
        app.tap()
        mediaLibraryPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    // Doesn't work on simulator
    func testBluetoothPeripheralAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Bluetooth") { (alert) -> Bool in
            guard let alertView = BluetoothPeripheralAlert(element: alert) else {
                XCTFail("Cannot create BluetoothPeripheralAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToBluetooth()
        // Interruption won't happen without some kind of action.
        app.tap()
        bluetoothPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    // Doesn't work on simulator
    func testMicrophoneAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Microphone") { (alert) -> Bool in
            guard let alertView = MicrophoneAlert(element: alert) else {
                XCTFail("Cannot create MicrophoneAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToMicrophone()
        // Interruption won't happen without some kind of action.
        app.tap()
        microphonePage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    // Doesn't work on simulator
    func testCallsAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Calls") { (alert) -> Bool in
            guard let alertView = CallsAlert(element: alert) else {
                XCTFail("Cannot create CallsAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToCalls()
        // Interruption won't happen without some kind of action.
        app.tap()
        callsPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testCalendarAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Calendar") { (alert) -> Bool in
            guard let alertView = CalendarAlert(element: alert) else {
                XCTFail("Cannot create CalendarAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToCalendar()
        // Interruption won't happen without some kind of action.
        app.tap()
        calendarPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }

    func testMotionAlert() {
        var handled = false
        let token = addUIInterruptionMonitor(withDescription: "Motion") { (alert) -> Bool in
            guard let alertView = MotionAlert(element: alert) else {
                XCTFail("Cannot create MotionAlert object")
                return false
            }

            XCTAssertTrue(alertView.denyElement.exists)
            XCTAssertTrue(alertView.allowElement.exists)

            alertView.denyElement.tap()
            handled = true
            return true
        }

        mainPage.goToPermissionsPageMenu()
        permissionsPage.goToMotion()
        // Interruption won't happen without some kind of action.
        app.tap()
        motionPage.goBack()
        permissionsPage.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }
}
