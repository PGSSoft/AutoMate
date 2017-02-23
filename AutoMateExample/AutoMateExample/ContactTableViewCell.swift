//
//  ContactTableViewCell.swift
//  AutoMateExample
//
//  Created by Joanna Bednarz on 23/02/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import Contacts

class ContactTableViewCell: UITableViewCell, ConfigurableCell {
    
    typealias T = CNContact
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var socialLabel: UILabel!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlAddressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configure(with data: T) {
        nameLabel.text = "\(data.givenName) \(data.familyName) (\(data.nickname))"
        
        if let socialProfile = data.socialProfiles.first {
            socialLabel.text = "\(socialProfile.label) (\(socialProfile.value.service))"
            profileLabel.text = socialProfile.value.username
        } else {
            socialLabel.isHidden = true
            profileLabel.isHidden = true
        }
        
        if let phoneNumber = data.phoneNumbers.first {
            phoneLabel.text = phoneNumber.label
            numberLabel.text = phoneNumber.value.stringValue
        } else {
            phoneLabel.isHidden = true
            numberLabel.isHidden = true
        }
        
        if let urlAddress = data.urlAddresses.first {
            urlLabel.text = urlAddress.label
            urlAddressLabel.text = urlAddress.value as String
        } else {
            urlLabel.isHidden = true
            urlAddressLabel.isHidden = true
        }
        
        if let emailAddress = data.emailAddresses.first {
            emailLabel.text = emailAddress.label
            emailAddressLabel.text = emailAddress.value as String
        } else {
            emailLabel.isHidden = true
            emailAddressLabel.isHidden = true
        }
        
        thumbnailImageView.image = data.thumbnailImageData.flatMap(UIImage.init(data:)) ?? #imageLiteral(resourceName: "automate_logo")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        socialLabel.isHidden = false
        profileLabel.isHidden = false
        phoneLabel.isHidden = false
        numberLabel.isHidden = false
        urlLabel.isHidden = false
        urlAddressLabel.isHidden = false
        emailLabel.isHidden = false
        emailAddressLabel.isHidden = false
    }
}
