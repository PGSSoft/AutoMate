//
//  LaunchEnviromentsTableViewController.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 21/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class LaunchEnviromentsTableViewController: UITableViewController {

    // MARK: Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "LaunchEnviromentDataSegueIdentifier", sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath,
            let enviroment = LaunchEnvironment(rawValue: indexPath.row),
            let destination = segue.destination as? LaunchEnvironmentsDataViewController else {
                return
        }
        destination.environment = enviroment
    }
}

enum LaunchEnvironment: Int {
    case eventKit, contact
}
