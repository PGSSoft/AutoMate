//
//  MiddleButtonViewController.swift
//  AutoMateExample
//
//  Created by Pawel Szot on 18/08/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

class MiddleButtonViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var label: UILabel!

    // MARK: IBActions
    @IBAction func buttonPressed(_ sender: AnyObject) {
        label.isHidden = false
    }

}
