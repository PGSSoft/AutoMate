//
//  ContactsData.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 14.03.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

public struct Contact {
    let firstName: String
    let lastName: String

    var name: String {
        return "\(firstName) \(lastName)"
    }
}
