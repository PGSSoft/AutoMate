//
//  MediaLibraryViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 16.02.2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import UIKit
import MediaPlayer

@available(iOS 9.3, *)
class MediaLibraryViewController: UIViewController {

    // MARK: - View life cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        MPMediaLibrary.requestAuthorization { _ in }
        MPMediaLibrary.requestAuthorization {
            print($0)
            print($0)
        }
    }
}
