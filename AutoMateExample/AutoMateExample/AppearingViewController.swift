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
    @IBOutlet weak var button: UIButton!
    @IBOutlet var madeWithLoveView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var stackView: UIStackView!

    // MARK: View lifecycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        button.hidden = true
        stackView.removeArrangedSubview(madeWithLoveView)
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator.startAnimating()
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue()) {
                self.button.hidden = false
                self.stackView.layoutIfNeeded()
        }
    }

    @IBAction func loadingDoneButtonTouched(sender: UIButton) {
        stackView.addArrangedSubview(madeWithLoveView)
        stackView.layoutIfNeeded()
    }
}
