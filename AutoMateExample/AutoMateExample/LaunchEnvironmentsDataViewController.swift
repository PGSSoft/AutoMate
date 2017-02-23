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
        case .eventKit:
            tableView.register(nibFor: EventKitTableViewCell.self)
            let eventsDataSource = EventKitTableViewDataSource()
            eventsDataSource.delegate = self
            tableView.dataSource = eventsDataSource
            dataSource = eventsDataSource
        case .contact:
            tableView.register(nibFor: ContactTableViewCell.self)
            let contactsDataSource = ContactsTableViewDataSource()
            contactsDataSource.delegate = self
            tableView.dataSource = contactsDataSource
            dataSource = contactsDataSource
        }
    }
    
    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource) {
        tableView.reloadData()
    }
}

class EventKitTableViewDataSource: LaunchEnvironmentTableDataSource<EventKitTableViewCell, EventKitDataStore> {
    
    init() {
        super.init(store: EventKitDataStore())
        dataStore.reloadData { [weak self] in
            self?.delegate?.didFinishReloadData(store: self!)
        }
    }
}

class ContactsTableViewDataSource: LaunchEnvironmentTableDataSource<ContactTableViewCell, ContactsDataStore> {
    
    init() {
        super.init(store: ContactsDataStore())
        dataStore.reloadData { [weak self] in
            self?.delegate?.didFinishReloadData(store: self!)
        }
    }
}
