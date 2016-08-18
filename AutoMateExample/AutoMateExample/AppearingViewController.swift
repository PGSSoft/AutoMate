//
//  AppearingViewController.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 17/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

class AppearingViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var button: UIButton!

    // MARK: View lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        button.hidden = true
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(5.0, animations: { self.view.backgroundColor = UIColor.yellowColor() }, completion: { _ in
            self.button.hidden = false
        })
    }
}
