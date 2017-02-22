//
//  ContactsDataStore.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 22/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Contacts

class ContactsDataStore: DataStore {
    // MARK: Typealias
    typealias T = CNContact
    // MARK: Properties
    weak var delegate: DataStoreDelegate?
    private(set) var data = [[T]()]

    private let store = CNContactStore()
    private let fetchRequest: CNContactFetchRequest = {
        return CNContactFetchRequest(keysToFetch: [
                                         CNContactEmailAddressesKey,
                                         CNContactFormatter.descriptorForRequiredKeys(for: .fullName)
                                     ].flatMap { $0 as? CNKeyDescriptor })
    }()

    // MARK: Methods
    func title(for section: Int) -> String? {
        return nil
    }

    func reloadData() {
        try? store.enumerateContacts(with: fetchRequest) { self.data[0].append($0.0) }
    }
}
