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

        addContact()
    }

    // MARK: Helpers
    /// Copied from https://developer.apple.com/reference/contacts
    private func addContact() {
        // Creating a mutable object to add to the contact
        let contact = CNMutableContact()

        contact.imageData = NSData() as Data // The profile picture as a Data object

        contact.givenName = "John"
        contact.familyName = "Appleseed"

        let homeEmail = CNLabeledValue(label:CNLabelHome, value:NSString(string: "john@example.com"))
        let workEmail = CNLabeledValue(label:CNLabelWork, value:NSString(string: "j.appleseed@icloud.com"))
        contact.emailAddresses = [homeEmail, workEmail]

        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:"(408) 555-0126"))]

        let homeAddress = CNMutablePostalAddress()
        homeAddress.street = "1 Infinite Loop"
        homeAddress.city = "Cupertino"
        homeAddress.state = "CA"
        homeAddress.postalCode = "95014"
        contact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]

        var birthday = DateComponents()
        birthday.day = 1
        birthday.month = 4
        birthday.year = 1988  // You can omit the year value for a yearless birthday
        contact.birthday = birthday

        // Saving the newly created contact
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        try? store.execute(saveRequest)
    }
}
