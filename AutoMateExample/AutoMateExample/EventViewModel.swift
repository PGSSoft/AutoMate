//
//  EventViewModel.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

struct EventViewModel {

    let title: String
    let startDate: Date
    let endDate: Date
    let calendar: String
    let location: String?

    var startDateString: String? {
        return DateFormatter.dayMonthAndYear.string(from: startDate)
    }
    var endDateString: String? {
        return DateFormatter.dayMonthAndYear.string(from: endDate)
    }

    public init(event: EKEvent) {
        title = event.title
        startDate = event.startDate
        endDate = event.endDate
        calendar = event.calendar.title
        location = event.location
    }

    func sortedAscending(with rightEvent: EventViewModel) -> Bool {
        return startDate < rightEvent.startDate
    }
}
