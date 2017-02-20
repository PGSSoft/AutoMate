//
//  PermissionsViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class PermissionsViewController: UIViewController {

    // Cell Struct
    fileprivate struct CellStruct {
        let name: String
        let action: String
        let identifier: String
    }

    // Properties
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "PermissionTableViewCell"
    fileprivate let cells = {
        return [
            CellStruct(name: "Location always", action: "LocationAlways", identifier: "locationAlways"),
            CellStruct(name: "Location when in use", action: "LocationWhenInUse", identifier: "locationWhenInUse"),
            CellStruct(name: "Contacts", action: "Contacts", identifier: "contacts"),
            CellStruct(name: "HomeKit", action: "HomeKit", identifier: "homeKit"),
            CellStruct(name: "HealthKit", action: "HealthKit", identifier: "healthKit"),
            CellStruct(name: "Speech Recognition", action: "SpeechRecognition", identifier: "speechRecognition"),
            CellStruct(name: "Siri", action: "Siri", identifier: "siri"),
            CellStruct(name: "Reminders", action: "Reminders", identifier: "reminders"),
            CellStruct(name: "Photos", action: "Photos", identifier: "photos"),
            CellStruct(name: "Camera", action: "Camera", identifier: "camera"),
            CellStruct(name: "Media Library", action: "MediaLibrary", identifier: "mediaLibrary"),
            CellStruct(name: "Bluetooth", action: "Bluetooth", identifier: "bluetooth"),
            CellStruct(name: "Microphone", action: "Microphone", identifier: "microphone"),
            CellStruct(name: "Calls", action: "Calls", identifier: "calls"),
            CellStruct(name: "Calendar", action: "Calendar", identifier: "calendar"),
            CellStruct(name: "Motion", action: "Motion", identifier: "motion")
        ]
    }()

    // View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "tableView"
    }
}

// MARK: - UITableViewDataSource
extension PermissionsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PermissionTableViewCell else {
            fatalError("Cannot deque cell")
        }

        let cellData = cells[indexPath.row]
        cell.nameLabel.text = cellData.name
        cell.accessibilityIdentifier = cellData.identifier
        return cell
    }
}

// MARK: - UITableViewDelegate
extension PermissionsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let cellData = cells[indexPath.row]
        performSegue(withIdentifier: cellData.action, sender: self)
    }
}
