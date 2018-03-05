//
//  ThirdViewController.swift
//  ViewSample
//
//  Created by 岡野 直史 on 2018/03/05.
//  Copyright © 2018年 szk-atmosphere. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.backgroundColor = .blue
        label.text = "Label"
        self.view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
        button.backgroundColor = .red
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        self.view.addSubview(button)
        
        let textField = UITextField(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
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
