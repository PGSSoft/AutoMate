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
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isAccessibilityElement = true
        activityIndicator.accessibilityIdentifier = "activityIndicator"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        button.isHidden = true
        madeWithLoveView.removeFromSuperview()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performAsync(after: 2) {
            self.button.isHidden = false
            self.stackView.layoutIfNeeded()
        }
    }

    @IBAction func loadingDoneButtonTouched(_ sender: UIButton) {
        performAsync(after: 4) {
            self.stackView.addArrangedSubview(self.madeWithLoveView)
            self.stackView.layoutIfNeeded()
        }
        button.isHidden = true
    }

    // MARK: Helpers
    private func performAsync(after delay: Int, closure: @escaping () -> Void) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(delay)) { [weak self] in
            guard let strongSelf = self else { return }

            closure()
            strongSelf.activityIndicator.stopAnimating()
        }
    }
}
