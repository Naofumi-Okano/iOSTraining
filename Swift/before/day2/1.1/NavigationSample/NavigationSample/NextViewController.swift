//
//  NextViewController.swift
//  NavigationSample
//
//  Created by 岡野 直史 on 2018/03/02.
//  Copyright © 2018年 szk-atmosphere. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var labelText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let buttonName = labelText {
            label.text = buttonName + " Tapped"
        } else {
            label.text = "none"
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
