//
//  SecondViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: class {
    func secondViewController(_ viewController: SecondViewController, didTapButton button: UIButton)
}

class SecondViewController: UIViewController {
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeTapped(_ sender: UIButton) {
        delegate?.secondViewController(self, didTapButton: sender)
    }
}
