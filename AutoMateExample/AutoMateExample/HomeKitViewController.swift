//
//  HomeKitViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import HomeKit

class HomeKitViewController: UIViewController {

    // MARK: Properties
    let manager = HMHomeManager()

    override func awakeFromNib() {
        super.awakeFromNib()
        manager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = manager.homes
    }
}

extension HomeKitViewController: HMHomeManagerDelegate { }
