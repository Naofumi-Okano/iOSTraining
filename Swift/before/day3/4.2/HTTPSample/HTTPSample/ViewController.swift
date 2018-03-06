//
//  ViewController.swift
//  HTTPSample
//
//  Created by 鈴木 大貴 on 2016/10/28.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let username = textField.text else { return }
        fetchUser(username)
    }
    
    private func fetchUser(_ username: String) {
        guard
            let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: "https://qiita.com/api/v2/users/\(encodedUsername)")
        else {
            print("Invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let object = try JSONSerialization.jsonObject(with: data, options: [])
                    print(object)
                    DispatchQueue.main.async {
                        self.textView.text = "\(object)"
                    }
                } catch let e {
                    print(e)
                    DispatchQueue.main.async {
                        self.textView.text = "\(e)"
                    }
                }
            } else {
                // error
                print("Invalid request")
            }
        }
        task.resume()
    }
}

