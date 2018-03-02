//
//  ViewController.swift
//  ExternalForceModal
//
//  Created by 鈴木大貴 on 2016/10/16.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showTapped(_ sender: UIButton) {
        openModalView()
    }
    
    func openModalView() {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        secondViewController.delegate = self
        present(secondViewController, animated: true, completion: nil)
    }
    
    func secondViewController(_ viewController: SecondViewController, didTapButton button: UIButton) {
        dismiss(animated: true, completion: openModalView)
    }
}

