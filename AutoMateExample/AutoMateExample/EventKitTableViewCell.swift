//
//  EventKitTableViewCell.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 21/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import EventKit

class EventKitTableViewCell: UITableViewCell, ConfigurableCell {

    typealias T = EKCalendarItem

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!

    func configure(with data: T) {
        titleLabel.text = data.title
        locationLabel.text = data.location
        calendarLabel.text = data.calendar.title
        notesLabel.text = data.notes

        if let creationDate = data.creationDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            formatter.string(from: creationDate)
        }
    }
}
