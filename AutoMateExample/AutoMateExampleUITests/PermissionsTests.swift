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

    // MARK: Arrange View Objects
    lazy var mainView: MainView = MainView(in: self.app)
    lazy var permissionsView: PermissionsView = PermissionsView(in: self.app)
    lazy var locationView: LocationView = LocationView(in: self.app)
    lazy var contactsView: ContactsView = ContactsView(in: self.app)
    lazy var homeKitView: HomeKitView = HomeKitView(in: self.app)
    lazy var healthKitView: HealthKitView = HealthKitView(in: self.app)
    lazy var healthPermissionView: HealthPermissionView = HealthPermissionView(in: self.app)
    lazy var speechRecognitionView: SpeechRecognitionView = SpeechRecognitionView(in: self.app)
    lazy var siriView: SiriView = SiriView(in: self.app)
    lazy var remindersView: RemindersView = RemindersView(in: self.app)
    lazy var photosView: PhotosView = PhotosView(in: self.app)
    lazy var cameraView: CameraView = CameraView(in: self.app)
    lazy var mediaLibraryView: MediaLibraryView = MediaLibraryView(in: self.app)
    lazy var bluetoothView: BluetoothView = BluetoothView(in: self.app)
    lazy var microphoneView: MicrophoneView = MicrophoneView(in: self.app)
    lazy var callsView: CallsView = CallsView(in: self.app)
    lazy var calendarView: CalendarView = CalendarView(in: self.app)
    lazy var motionView: MotionView = MotionView(in: self.app)

    // MARK: Set up
    override func setUp() {
        super.setUp()
        TestLauncher.configureWithDefaultOptions(app).launch()
        wait(forVisibilityOf: mainView)
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToLocationWhenInUse()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToLocationAlways()
        // Interruption won't happen without some kind of action.
        app.tap()
        locationView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToContacts()
        // Interruption won't happen without some kind of action.
        app.tap()
        contactsView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToHomeKit()
        // Interruption won't happen without some kind of action.
        app.tap()
        homeKitView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToHealthKit()

        wait(forVisibilityOf: healthPermissionView)
        XCTAssertTrue(healthPermissionView.allowElement.exists)
        XCTAssertTrue(healthPermissionView.denyElement.exists)
        XCTAssertTrue(healthPermissionView.turnOnAllElement.exists)

        healthPermissionView.turnOnAllElement.tap()

        XCTAssertTrue(healthPermissionView.turnOffAllElement.exists)

        healthPermissionView.denyElement.tap()
        app.tap()

        healthKitView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToSpeechRecognition()
        // Interruption won't happen without some kind of action.
        app.tap()
        speechRecognitionView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToSiri()
        // Interruption won't happen without some kind of action.
        app.tap()
        siriView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToReminders()
        // Interruption won't happen without some kind of action.
        app.tap()
        remindersView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToPhotos()
        // Interruption won't happen without some kind of action.
        app.tap()
        photosView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToCamera()
        // Interruption won't happen without some kind of action.
        app.tap()
        cameraView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToMediaLibrary()
        // Interruption won't happen without some kind of action.
        app.tap()
        mediaLibraryView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToBluetooth()
        // Interruption won't happen without some kind of action.
        app.tap()
        bluetoothView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToMicrophone()
        // Interruption won't happen without some kind of action.
        app.tap()
        microphoneView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToCalls()
        // Interruption won't happen without some kind of action.
        app.tap()
        callsView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToCalendar()
        // Interruption won't happen without some kind of action.
        app.tap()
        calendarView.goBack()
        permissionsView.goBack()
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

        mainView.goToPermissionsViewMenu()
        permissionsView.goToMotion()
        // Interruption won't happen without some kind of action.
        app.tap()
        motionView.goBack()
        permissionsView.goBack()
        removeUIInterruptionMonitor(token)
        XCTAssertTrue(handled)
    }
}
