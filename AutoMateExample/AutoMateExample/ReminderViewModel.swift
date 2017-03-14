//
//  ReminderViewModel.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import EventKit

// MARK: - ReminderViewModel
struct ReminderViewModel {

    // MARK: Properties
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

    fileprivate let reminderIdentifier: String

    // MARK: Initialization
    init(reminder: EKReminder) {
        reminderIdentifier = reminder.calendarItemIdentifier
        title = reminder.title
        startDate = reminder.startDateComponents?.date
        completionDate = reminder.completionDate
        calendar = reminder.calendar.title
        notes = reminder.notes
    }
}

func < (lhs: ReminderViewModel, rhs: ReminderViewModel) -> Bool {

    if let lhsStartDate = lhs.startDate, let rhsStartDate = rhs.startDate, lhsStartDate != rhsStartDate {
        return lhsStartDate < rhsStartDate
    } else if lhs.title != rhs.title {
        return lhs.title < rhs.title
    }
    return lhs.reminderIdentifier < rhs.reminderIdentifier
}
