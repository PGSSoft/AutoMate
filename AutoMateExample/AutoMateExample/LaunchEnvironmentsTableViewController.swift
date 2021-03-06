//
//  LaunchEnviromentsTableViewController.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 21/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - LaunchEnviromentsTableViewController
class LaunchEnviromentsTableViewController: UITableViewController {

    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "LaunchEnviromentDataSegueIdentifier", sender: indexPath)
    }

    // MARK: UIViewController - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath,
            let enviroment = LaunchEnvironment(rawValue: indexPath.row),
            let destination = segue.destination as? LaunchEnvironmentsDataViewController else {
                return
        }
        destination.environment = enviroment
    }
}

// MARK: - LaunchEnvironment
enum LaunchEnvironment: Int {
    case event, reminder, contact

    var title: String {
        switch self {
        case .event: return "Events"
        case .reminder: return "Reminders"
        case .contact: return "Contacts"
        }
    }
}
