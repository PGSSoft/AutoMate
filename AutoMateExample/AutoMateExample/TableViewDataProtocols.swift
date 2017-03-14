//
//  TableViewDataProtocols.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - DataStore protocol
protocol DataStore {

    // MARK: Associatedtype
    associatedtype T

    // MARK: Properties
    var sectionsCount: Int { get }

    // MARK: Methods
    func rowsCount(in section: Int) -> Int
    func dataForRow(at indexPath: IndexPath) -> T
    func title(for section: Int) -> String?
    func reloadData(completion: @escaping () -> Void)
}

// MARK: - ConfigurableCell protocol
protocol ConfigurableCell {

    // MARK: Associatedtype
    associatedtype T

    // MARK: Properties
    static var reusableIdentifier: String { get }
    static var nibName: String { get }

    // MARK: Methods
    func configure(with model: T)
}

// MARK: Default implementation for UITableViewCell
extension ConfigurableCell where Self: UITableViewCell {

    static var reusableIdentifier: String {
        return String(describing: self)
    }

    static var nibName: String {
        return String(describing: self)
    }
}

// MARK: - LaunchEnvironmentTableDataSourceProtocol
protocol LaunchEnvironmentTableDataSourceProtocol {

    // MARK: Associatedtype
    associatedtype Store: DataStore
    associatedtype Cell: UITableViewCell, ConfigurableCell

    // MARK: Properties
    var dataStore: Store { get }
    weak var delegate: LaunchEnvironmentTableDataSourceDelegate? { get }
}

// MARK: - LaunchEnvironmentTableDataSourceDelegate protocol
protocol LaunchEnvironmentTableDataSourceDelegate: class {

    // MARK: Methods
    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource)
}
