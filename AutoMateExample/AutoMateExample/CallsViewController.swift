//
//  CallsViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import CallKit

@available(iOS 10.0, *)
class CallsViewController: UIViewController {

    // MARK: Properties
    var provider: CXProvider!

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "providerName"))
    }
}
