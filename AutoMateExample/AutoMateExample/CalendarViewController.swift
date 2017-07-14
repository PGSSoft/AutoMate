//
//  CalendarViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import EventKit

class CalendarViewController: UIViewController {

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        EKEventStore().requestAccess(to: .event) { _, _  in }
    }
}
