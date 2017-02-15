//
//  AlertsFactory.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation
import AutoMate

enum AlertsFactory {

    static var allAlerts: [SystemAlert.Type] {
        return [
            SpeechRecognitionAlert.self,
            SiriAlert.self,
            RemindersAlert.self,
            PhotosAlert.self,
            CameraAlert.self,
            AddressBookAlert.self,
            MediaLibraryAlert.self,
            BluetoothPeripheralAlert.self,
            MicrophoneAlert.self,
            CallsAlert.self,
            CalendarAlert.self,
            MotionAlert.self,
            WillowAlert.self,
            LocationUpgradeWhenInUseAlwaysAlert.self,
            LocationAlwaysAlert.self,
            LocationWhenInUseAlert.self,
            HealthAlert.self
        ]
    }
}
