//
//  TableViewDataProtocols.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

protocol DataStore {
    associatedtype T
    var data: [[T]] { get }
    func title(for section: Int) -> String?
    func reloadData(completion: @escaping () -> Void)
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

protocol LaunchEnvironmentTableDataSourceDelegate: class {
    func didFinishReloadData<DataSource: LaunchEnvironmentTableDataSourceProtocol>(store: DataSource)
}

protocol ConfigurableCell {
    associatedtype T
    static var reusableIdentifier: String { get }
    func configure(with data: T)
    static var nibName: String { get }
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

    associatedtype Store: DataStore
    associatedtype Cell: UITableViewCell, ConfigurableCell

    var dataStore: Store { get }
    weak var delegate: LaunchEnvironmentTableDataSourceDelegate? { get }
}
