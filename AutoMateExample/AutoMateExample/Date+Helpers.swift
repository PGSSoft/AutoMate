//
//  Date+PredefinedDates.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

extension Date {
    static let yearAgo: Date = {
        guard let date = Calendar(identifier: .gregorian).date(byAdding: .year, value: -1, to: Date()) else {
            preconditionFailure("Date could not be calculated with the given input.")
        }
        return date
    }()

    static let nextYear: Date = {
        guard let date = Calendar(identifier: .gregorian).date(byAdding: .year, value: 1, to: Date()) else {
            preconditionFailure("Date could not be calculated with the given input.")
        }
        return date
    }()
}

extension DateFormatter {

    static let fullMonthAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM y"
        return formatter
    }()

    static let fullDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
}
