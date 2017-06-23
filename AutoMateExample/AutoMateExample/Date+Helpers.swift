//
//  Date+PredefinedDates.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 10/03/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import Foundation

// MARK: Date helpers
extension Date {

    static let year2017: Date = {
        guard let date = Calendar(identifier: .gregorian).date(from: DateComponents(year: 2017)) else {
            preconditionFailure("Date could not be calculated with the given input.")
        }
        return date
    }()

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

// MARK: Predefined DateFormatter
extension DateFormatter {

    static let fullMonthAndYear: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM y"
        return formatter
    }()

    static let fullDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd k:mm:ss"
        return formatter
    }()
}
