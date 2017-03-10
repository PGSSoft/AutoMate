//
//  LaunchEnviromentsDataViewController.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class LaunchEnvironmentsDataViewController: UIViewController, LaunchEnvironmentTableDataSourceDelegate {

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
        case .event:
            tableView.register(nibFor: EventTableViewCell.self)
            let dataSource = EventsTableViewDataSource()
            dataSource.delegate = self
            tableView.dataSource = dataSource
            self.dataSource = dataSource

        case .reminder:
            tableView.register(nibFor: ReminderTableViewCell.self)
            let dataSource = RemindersTableViewDataSource()
            dataSource.delegate = self
            tableView.dataSource = dataSource
            self.dataSource = dataSource

        case .contact:
            tableView.register(nibFor: ContactTableViewCell.self)
            let dataSource = ContactsTableViewDataSource()
            dataSource.delegate = self
            tableView.dataSource = dataSource
            self.dataSource = dataSource
        }
    }

    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource) {
        tableView.reloadData()
    }
}

class EventsTableViewDataSource: LaunchEnvironmentTableDataSource<EventTableViewCell, EventsDataStore> {

    init() {
        super.init(store: EventsDataStore())
        dataStore.reloadData { [weak self] in
            DispatchQueue.main.async {
                self?.delegate?.didFinishReloadData(store: self!)
            }
        }
    }
}

class RemindersTableViewDataSource: LaunchEnvironmentTableDataSource<ReminderTableViewCell, RemindersDataStore> {

    init() {
        super.init(store: RemindersDataStore())
        dataStore.reloadData { [weak self] in
            DispatchQueue.main.async {
                self?.delegate?.didFinishReloadData(store: self!)
            }
        }
    }
}

class ContactsTableViewDataSource: LaunchEnvironmentTableDataSource<ContactTableViewCell, ContactsDataStore> {

    init() {
        super.init(store: ContactsDataStore())
        dataStore.reloadData { [weak self] in
            DispatchQueue.main.async {
                self?.delegate?.didFinishReloadData(store: self!)
            }
        }
    }
}
