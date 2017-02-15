//
//  MainViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 23.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "tableView"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
}
