//
//  ScrollingHorizontallyViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 05.04.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit

class ScrollingHorizontallyViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.accessibilityIdentifier = "scrollView"
    }
}
