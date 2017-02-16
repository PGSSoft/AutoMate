//
//  MicrophoneViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import AVFoundation

class MicrophoneViewController: UIViewController {

    // MARK: View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeAudio) { _ in }
    }
}
