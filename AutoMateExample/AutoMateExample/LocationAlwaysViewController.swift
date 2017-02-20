//
//  LocationAlwaysViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAlwaysViewController: UIViewController {

    // MARK: Properties
    let manager = CLLocationManager()

    // MARK: View lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.requestAlwaysAuthorization()
    }

}
