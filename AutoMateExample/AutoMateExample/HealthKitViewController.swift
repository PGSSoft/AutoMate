//
//  HealthKitViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 15.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import HealthKit

class HealthKitViewController: UIViewController {

    // MARK: Properties
    let store = HKHealthStore()

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        store.requestAuthorization(toShare: [HKObjectType.workoutType()], read: [HKObjectType.workoutType()]) { _, _  in }
    }
}
