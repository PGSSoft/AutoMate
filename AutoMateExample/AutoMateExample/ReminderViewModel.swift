//
//  ReminderViewModel.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

struct ReminderViewModel {

    let title: String
    let startDate: Date?
    let completionDate: Date?
    let calendar: String
    let notes: String?

    var startDateString: String? {
        guard let date = startDate else { return nil }
        return DateFormatter.fullDate.string(from: date)
    }
    var completionDateString: String? {
        guard let date = completionDate else { return nil }
        return DateFormatter.fullDate.string(from: date)
    }

    init(reminder: EKReminder) {
        title = reminder.title
        startDate = reminder.startDateComponents?.date
        completionDate = reminder.completionDate
        calendar = reminder.calendar.title
        notes = reminder.notes
    }

    func sortedAscending(with rightReminder: ReminderViewModel) -> Bool {
        guard let leftStartDate = startDate, let rightStartDate = rightReminder.startDate else {
            return title < rightReminder.title
        }
        return leftStartDate < rightStartDate
    }
}
