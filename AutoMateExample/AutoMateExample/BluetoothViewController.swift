//
//  BluetoothViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import CoreBluetooth

class BluetoothViewController: UIViewController {

    // MARK: Properties
    var manager: CBCentralManager!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
}

extension BluetoothViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {

    }
}
