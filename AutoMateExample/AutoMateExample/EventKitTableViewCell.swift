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

    func configure(with data: T) {

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
