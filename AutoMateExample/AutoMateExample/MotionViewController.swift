//
//  MotionViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import CoreMotion

class MotionViewController: UIViewController {

    // MARK: Properties
    var manager: CMMotionActivityManager?

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager = CMMotionActivityManager()
        manager?.startActivityUpdates(to: OperationQueue.main, withHandler: { _ in })
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        manager?.stopActivityUpdates()
    }
}
