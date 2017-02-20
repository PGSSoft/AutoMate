//
//  SpeechRecognitionViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import Speech

@available(iOS 10.0, *)
class SpeechRecognitionViewController: UIViewController {

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SFSpeechRecognizer.requestAuthorization { _ in }
    }
}
