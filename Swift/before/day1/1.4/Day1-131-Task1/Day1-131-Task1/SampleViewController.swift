//
//  SampleViewController.swift
//  Day1-131-Task1
//
//  Created by 岡野 直史 on 2018/03/02.
//  Copyright © 2018年 岡野 直史. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = "Test"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = "YES"
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "presentSecondViewController", sender: self)
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        guard let secondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {
            return
        }
        present(secondViewController, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        guard let identifier = segue.identifier, identifier == "presentSecondViewController" else {
            return
        }
        let destination = segue.destination
    }
}
