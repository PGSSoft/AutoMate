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
    @IBOutlet var notExistingButton: UIButton!

    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        button.isHidden = true

        notExistingButton.removeFromSuperview()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5.0, animations: { self.view.backgroundColor = UIColor.yellow }, completion: { _ in
            self.button.isHidden = false
            self.view.addSubview(self.notExistingButton)
        })
    }
}
