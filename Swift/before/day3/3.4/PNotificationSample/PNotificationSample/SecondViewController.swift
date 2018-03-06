//
//  SecondViewController.swift
//  PNotificationSample
//
//  Created by 岡野 直史 on 2018/03/06.
//  Copyright © 2018年 岡野 直史. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak final var label: UILabel!
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(type(of: self).recieveNotification(_:)), name: Notification.Name(rawValue: "pushNotificationTapped"), object: nil)
    }
    
    @objc func recieveNotification(_ notification: Notification) {
        guard let value = notification.userInfo?["key"] as? String else { return }
        label.text = value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
