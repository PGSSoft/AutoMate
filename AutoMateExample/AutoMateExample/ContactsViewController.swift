//
//  ContactsViewController.swift
//  AutoMateExample
//
//  Created by Ewelina Cyło on 08/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import Contacts

class ContactsViewController: UIViewController {
    // MARK: View lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        CNContactStore().requestAccess(for: .contacts) { _ in }
    }
}
