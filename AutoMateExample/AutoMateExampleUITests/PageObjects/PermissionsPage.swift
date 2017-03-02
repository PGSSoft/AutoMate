//
//  PermissionsPage.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

// MARK: - PermissionsPage
open class PermissionsPage: BaseAppPage, PushedPage {

    // MARK: Elements
    open var tableView: XCUIElement {
        return view.tables[Locators.tableView]
    }

    open var locationAlways: XCUIElement {
        return tableView.cells[Locators.locationAlways]
    }

    open var locationWhenInUse: XCUIElement {
        return tableView.cells[Locators.locationWhenInUse]
    }

    open var contacts: XCUIElement {
        return tableView.cells[Locators.contacts]
    }

    open var homeKit: XCUIElement {
        return tableView.cells[Locators.homeKit]
    }

    open var healthKit: XCUIElement {
        return tableView.cells[Locators.healthKit]
    }

    open var speechRecognition: XCUIElement {
        return tableView.cells[Locators.speechRecognition]
    }

    open var siri: XCUIElement {
        return tableView.cells[Locators.siri]
    }

    open var reminders: XCUIElement {
        return tableView.cells[Locators.reminders]
    }

    open var photos: XCUIElement {
        return tableView.cells[Locators.photos]
    }

    open var camera: XCUIElement {
        return tableView.cells[Locators.camera]
    }

    open var mediaLibrary: XCUIElement {
        return tableView.cells[Locators.mediaLibrary]
    }

    open var bluetooth: XCUIElement {
        return tableView.cells[Locators.bluetooth]
    }

    open var microphone: XCUIElement {
        return tableView.cells[Locators.microphone]
    }

    open var calls: XCUIElement {
        return tableView.cells[Locators.calls]
    }

    open var calendar: XCUIElement {
        return tableView.cells[Locators.calendar]
    }

    open var motion: XCUIElement {
        return tableView.cells[Locators.motion]
    }

    // MARK: Actions
    open func goToLocationAlways() {
        locationAlways.tap()
    }

    open func goToLocationWhenInUse() {
        locationWhenInUse.tap()
    }

    open func goToContacts() {
        contacts.tap()
    }

    open func goToHomeKit() {
        homeKit.tap()
    }

    open func goToHealthKit() {
        healthKit.tap()
    }

    open func goToSpeechRecognition() {
        speechRecognition.tap()
    }

    open func goToSiri() {
        siri.tap()
    }

    open func goToReminders() {
        reminders.tap()
    }

    open func goToPhotos() {
        photos.tap()
    }

    open func goToCamera() {
        camera.tap()
    }

    open func goToMediaLibrary() {
        mediaLibrary.tap()
    }

    open func goToBluetooth() {
        bluetooth.tap()
    }

    open func goToMicrophone() {
        microphone.tap()
    }

    open func goToCalls() {
        calls.tap()
    }

    open func goToCalendar() {
        calendar.tap()
    }

    open func goToMotion() {
        motion.tap()
    }
}

// MARK: - IdentifiableByElement
extension PermissionsPage: IdentifiableByElement {

    public var identifingElement: XCUIElement {
        return tableView
    }
}

// MARK: - Locators
private extension PermissionsPage {

    enum Locators: String, Locator {
        case tableView = "permissionTableView"
        case menuItemName

        case locationAlways
        case locationWhenInUse
        case contacts
        case homeKit
        case healthKit

        case speechRecognition
        case siri
        case reminders
        case photos
        case camera
        case mediaLibrary
        case bluetooth
        case microphone
        case calls
        case calendar
        case motion
    }
}
