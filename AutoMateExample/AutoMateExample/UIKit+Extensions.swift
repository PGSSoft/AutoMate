//
//  UIKit+Extensions.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - UITableView helpers for UITableViewCell conforming to ConfigurableCell
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

    func register<Cell: UITableViewCell>(_ cellClass: Cell.Type) where Cell: ConfigurableCell {
        register(cellClass, forCellReuseIdentifier: cellClass.reusableIdentifier)
    }

    func register<Cell: UITableViewCell>(nibFor cellClass: Cell.Type, in bundle: Bundle? = nil) where Cell: ConfigurableCell {
        register(UINib(nibName: cellClass.nibName, bundle: bundle), forCellReuseIdentifier: cellClass.reusableIdentifier)
    }
}
