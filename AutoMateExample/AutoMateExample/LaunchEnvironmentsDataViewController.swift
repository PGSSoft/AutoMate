//
//  LaunchEnviromentsDataViewController.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class LaunchEnvironmentsDataViewController: UIViewController, DataStoreDelegate {

    var environment: LaunchEnvironment!
    @IBOutlet weak var tableView: UITableView!
    var dataSource: UITableViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure(for: environment)
        tableView.reloadData()
    }

    func configure(for environment: LaunchEnvironment) {
        switch environment {
        case .eventKit:
            let dataStore = EventKitDataStore()
            dataStore.delegate = self
            dataStore.reloadData()
            dataSource = LaunchEnvironmentTableDataSource<EventKitTableViewCell, EventKitDataStore>(store: dataStore)
        default:
            preconditionFailure()
        }
        tableView.dataSource = dataSource
    }

    func didFinishReloadData<D: DataStore>(store: D) {
        tableView.reloadData()
    }
}
