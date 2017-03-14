//
//  EventViewModel.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

// MARK: - EventViewModel
struct EventViewModel {

    // MARK: Properties
    let title: String
    let startDate: Date
    let endDate: Date
    let calendar: String
    let location: String?

    var startDateString: String? {
        return DateFormatter.fullDate.string(from: startDate)
    }
    var endDateString: String? {
        return DateFormatter.fullDate.string(from: endDate)
    }

    fileprivate let eventIdentifier: String

    // MARK: Initialization
    public init(event: EKEvent) {
        eventIdentifier = event.eventIdentifier
        title = event.title
        startDate = event.startDate
        endDate = event.endDate
        calendar = event.calendar.title
        location = event.location
    }
}

func < (lhs: EventViewModel, rhs: EventViewModel) -> Bool {
    return lhs.startDate < rhs.startDate
        || lhs.eventIdentifier < rhs.eventIdentifier
}
