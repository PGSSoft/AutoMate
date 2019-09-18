//
//  SliderTableViewCell.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 01/09/2019.
//  Copyright © 2019 PGS Software. All rights reserved.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    @IBOutlet weak var sliderValueLabel: UILabel!

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValueLabel.text = String(format: ".2f: %.2f", sender.value)
    }
}
