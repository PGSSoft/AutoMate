//
//  EventKitData.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 28/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

public struct Event {
    let title: String
    let calendar: String
    let location: String
    let startDate: String
    let endDate: String
}

public struct Reminder {
    let title: String
    let calendar: String
    let notes: String
    let startDate: String
    let completionDate: String
}
