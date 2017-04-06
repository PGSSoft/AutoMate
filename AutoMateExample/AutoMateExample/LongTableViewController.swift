//
//  TableViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 06.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - LongTableViewController
class LongTableViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "tableView"
    }
}

// MARK: - UITableViewDataSource
extension LongTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.configuredCell(for: indexPath, with: indexPath) as TableViewCell
    }
}

// MARK: - TableViewCell
class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
}

// MARK: - ConfigurableCell
extension TableViewCell: ConfigurableCell {
    func configure(with model: IndexPath) {
        nameLabel.text = "\(model.row)"
    }
}
