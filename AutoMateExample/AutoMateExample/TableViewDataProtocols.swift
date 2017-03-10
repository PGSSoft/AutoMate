//
//  TableViewDataProtocols.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

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

protocol LaunchEnvironmentTableDataSourceDelegate: class {
    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource)
}

protocol ConfigurableCell {

    // MARK: Associatedtype
    associatedtype T

    // MARK: Properties
    static var reusableIdentifier: String { get }
    static var nibName: String { get }

    // MARK: Methods
    func configure(with model: T)
}

extension ConfigurableCell where Self: UITableViewCell {

    static var reusableIdentifier: String {
        return String(describing: self)
    }

    static var nibName: String {
        return String(describing: self)
    }
}

protocol LaunchEnvironmentTableDataSourceProtocol {

    // MARK: Associatedtype
    associatedtype Store: DataStore
    associatedtype Cell: UITableViewCell, ConfigurableCell

    // MARK: Properties
    var dataStore: Store { get }
    weak var delegate: LaunchEnvironmentTableDataSourceDelegate? { get }
}
