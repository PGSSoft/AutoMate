//
//  CollectionViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 06.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

// MARK: - CollectionViewController
class CollectionViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.accessibilityIdentifier = "collectionView"
    }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.configuredCell(for: indexPath, with: indexPath) as CollectionViewCell
    }
}

// MARK: - CollectionViewCell
class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
}

// MARL: - ConfigurableCell
extension CollectionViewCell: ConfigurableCell {
    func configure(with model: IndexPath) {
        nameLabel.text = "\(model.row)"
    }
}
