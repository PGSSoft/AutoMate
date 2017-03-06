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
    @IBOutlet var requestLabel: UILabel!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationWhenInUseViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        requestLabel.text = "\(status.rawValue)"
    }
}
