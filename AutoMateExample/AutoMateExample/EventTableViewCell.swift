//
//  EventKitTableViewCell.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 21/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import EventKit

class EventTableViewCell: UITableViewCell, ConfigurableCell {

    // MARK: Properties - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var calendarLabel: UILabel!

    // MARK: ConfigurableCell - Methods
    func configure(with model: EventViewModel) {
        titleLabel.text = model.title
        locationLabel.text = model.location
        calendarLabel.text = model.calendar
        startDateLabel.text = model.startDateString
        endDateLabel.text = model.endDateString
    }
}
