//
//  FirstViewController.swift
//  PNotificationSample
//
//  Created by 岡野 直史 on 2018/03/06.
//  Copyright © 2018年 岡野 直史. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushNotificationTapped(_ sender: UIButton) {
        let dict = ["key" : "value"]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushNotificationTapped"), object: self, userInfo: dict)
    }
}
