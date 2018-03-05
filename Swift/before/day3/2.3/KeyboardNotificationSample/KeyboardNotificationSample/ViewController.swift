//
//  ViewController.swift
//  KeyboardNotificationSample
//
//  Created by 鈴木大貴 on 2016/10/29.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rightButton = UIBarButtonItem(title: "keyboard hide", style: .plain, target: self, action: #selector(ViewController.rightButtonTapped(_:)))
        navigationItem.rightBarButtonItem = rightButton
        
        NotificationCenter.default.addObserver(self,
                                     selector: #selector(ViewController.keyboardWillShow(_:)),
                                         name: NSNotification.Name.UIKeyboardWillShow,
                                       object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ViewController.keyboardWillHide(_:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - KeyboardNotification
    func keyboardWillShow(_ notification: Notification) {
        print(notification.userInfo)
        print("Show")
        
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let rawAnimationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt,
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }
        
        print("Change \(keyboardFrame.size.height)")
        textViewBottomConstraint.constant = keyboardFrame.size.height
        let animationCurve = UIViewAnimationOptions(rawValue: rawAnimationCurve)
        UIView.animate(withDuration: animationDuration, delay: 0, options:animationCurve, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func keyboardWillHide(_ notification: Notification) {
        print(notification.userInfo)
        print("Hide")
        
        guard
            let userInfo = notification.userInfo,
            let rawAnimationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt,
            let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval
        else { return }

        textViewBottomConstraint.constant = 0
        let animationCurve = UIViewAnimationOptions(rawValue: rawAnimationCurve)
        UIView.animate(withDuration: animationDuration, delay: 0, options:animationCurve, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func rightButtonTapped(_ sender: UIBarButtonItem) {
        textView.resignFirstResponder()
    }
}

