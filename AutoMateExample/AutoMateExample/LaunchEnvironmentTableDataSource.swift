//
//  LaunchEnvironmentTableDataSource.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 20/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - LaunchEnvironmentTableDataSource
class LaunchEnvironmentTableDataSource<C, S>: NSObject, LaunchEnvironmentTableDataSourceProtocol, UITableViewDataSource where C: UITableViewCell, C: ConfigurableCell, S: DataStore, C.T == S.T {

    // MARK: - LaunchEnvironmentTableDataSourceProtocol
    // MARK: Typealiases
    typealias Cell = C
    typealias Store = S

    // MARK: Properties
    var dataStore: Store
    weak var delegate: LaunchEnvironmentTableDataSourceDelegate?

    // MARK: - Initialization
    init(store: Store) {
        dataStore = store
    }

    // MARK: - UITableViewDataSource
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
