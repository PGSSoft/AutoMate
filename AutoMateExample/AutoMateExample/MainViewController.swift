//
//  MainViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 23.01.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        tableView.accessibilityIdentifier = "tableView"
    }
}

extension MainViewController: UINavigationControllerDelegate {
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return .all
    }
}
