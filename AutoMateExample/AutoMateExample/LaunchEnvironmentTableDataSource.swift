//
//  LaunchEnvironmentTableDataSource.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

protocol DataStore {
    associatedtype T
    var delegate: DataStoreDelegate? { get }
    var data: [[T]] { get }
    func title(for section: Int) -> String?
    func reloadData()
}

extension DataStore {

    var sectionsCount: Int {
        return data.count
    }

    func rowsCount(in section: Int) -> Int {
        return data[section].count
    }

    func dataForRow(at indexPath: IndexPath) -> T {
        return data[indexPath.section][indexPath.row]
    }
}

protocol DataStoreDelegate: class {
    func didFinishReloadData<D: DataStore>(store: D)
}

protocol ConfigurableCell {
    associatedtype T
    static var reusableIdentifier: String { get }
    func configure(with data: T)
}

extension ConfigurableCell where Self: UITableViewCell {

    static var reusableIdentifier: String {
        return String(describing: self)
    }
}

protocol LaunchEnvironmentTableDataSourceProtocol {

    associatedtype Store: DataStore
    associatedtype Cell: UITableViewCell, ConfigurableCell

    var dataStore: Store { get }
}

class LaunchEnvironmentTableDataSource<C, S>: NSObject, LaunchEnvironmentTableDataSourceProtocol, UITableViewDataSource where C: UITableViewCell, C: ConfigurableCell, S: DataStore, C.T == S.T {
    typealias Cell = C
    typealias Store = S

    var dataStore: Store

    init(store: Store) {
        dataStore = store
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStore.sectionsCount
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataStore.title(for: section)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.rowsCount(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataStore.dataForRow(at: indexPath)
        return tableView.configuredCell(for: indexPath, with: data) as Cell
    }
}

extension UITableView {

    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell where Cell: ConfigurableCell {
        guard let cell = dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as? Cell else {
            preconditionFailure("Couldn't dequeue cell with identifier \(Cell.reusableIdentifier)")
        }
        return cell
    }

    func configuredCell<Cell: UITableViewCell>(for indexPath: IndexPath, with data: Cell.T) -> Cell where Cell: ConfigurableCell {
        let cell: Cell = dequeueReusableCell(for: indexPath)
        cell.configure(with: data)
        return cell
    }
}
