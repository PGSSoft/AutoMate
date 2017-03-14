//
//  LaunchEnviromentsDataViewController.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - LaunchEnvironmentsDataViewController
class LaunchEnvironmentsDataViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!

    var environment: LaunchEnvironment!
    var dataSource: UITableViewDataSource!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(for: environment)
        tableView.accessibilityIdentifier = "dataTableView"
        tableView.reloadData()
    }

    // MARK: Helpers
    private func configure(for environment: LaunchEnvironment) {
        title = environment.title
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
}

// MARK: - LaunchEnvironmentTableDataSourceDelegate
extension LaunchEnvironmentsDataViewController: LaunchEnvironmentTableDataSourceDelegate {

    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource) {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension LaunchEnvironmentsDataViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - EventsTableViewDataSource
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

// MARK: - RemindersTableViewDataSource
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

// MARK: - ContactsTableViewDataSource
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
