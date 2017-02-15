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
            CellStruct(name: "Location", action: "Location", identifier: "location"),
            CellStruct(name: "Contacts", action: "Contacts", identifier: "contacts"),
            CellStruct(name: "HomeKit", action: "HomeKit", identifier: "homeKit"),
            CellStruct(name: "HealthKit", action: "HealthKit", identifier: "healthKit")
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
