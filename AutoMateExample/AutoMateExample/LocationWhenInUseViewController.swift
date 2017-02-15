//
//  LocationVIewController.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 18/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit
import CoreLocation

class LocationWhenInUseViewController: UIViewController {

    // MARK: Properties
    let manager = CLLocationManager()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.requestWhenInUseAuthorization()
    }
}
