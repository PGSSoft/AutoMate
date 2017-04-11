//
//  RotationViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 10.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!

    @IBOutlet weak var label: UILabel!

    // MARK: View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }

    // MARK: Actions
    @IBAction func buttonTouched(_ sender: UIButton) {
        if let title = sender.title(for: .normal) {
            label.text = "\(title)"
        }
    }

    @IBAction func showNavigationTouched(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
