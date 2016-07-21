//
//  ViewController.swift
//  AutoMateExample
//
//  Created by Paweł Szot on 21/07/16.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var textView: UITextView!

    //MARK - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("title-label-text", comment: "")
        textView.text = ""
        textView.accessibilityIdentifier = "input-text-view"
        counterLabel.accessibilityIdentifier = "counter-label"
        updateView()
    }

    // MARK: - UITextViewDelegate
    func textViewDidChange(textView: UITextView) {
        updateView()
    }


    // MARK: - Helpers
    func updateView() {
        let count = textView.text.characters.count
        counterLabel.text = "\(count)"
    }
}
