//
//  ScrollingViewController.swift
//  AutoMateExample
//
//  Created by Bartosz Janda on 20.09.2016.
//  Copyright © 2016 PGS Software. All rights reserved.
//

import UIKit

class ScrollingViewController: UIViewController {

    // MARK: @IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // MARK: Notifications
    func keyboardWillShow(notification: NSNotification) {
        guard let keyboardEndFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }

        let keyboardFrame = view.convert(keyboardEndFrame, from: nil)

        UIView.animate(withDuration: animationDuration) {
            self.scrollView.scrollIndicatorInsets.bottom = keyboardFrame.height
        }
    }

    func keyboardWillHide(notification: NSNotification) {
        guard let animationDuration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }

        UIView.animate(withDuration: animationDuration) {
            self.scrollView.scrollIndicatorInsets.bottom = 0
        }
    }
}
