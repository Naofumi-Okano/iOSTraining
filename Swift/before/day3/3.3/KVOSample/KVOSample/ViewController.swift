//
//  ViewController.swift
//  KVOSample
//
//  Created by 岡野 直史 on 2018/03/06.
//  Copyright © 2018年 岡野 直史. All rights reserved.
//

import UIKit

class Counter: NSObject {
    static let shared = Counter()
    
    @objc dynamic var count: Int = 0
    
    private override init() {
        super.init()
    }
}

class ViewController: UIViewController {
    @IBOutlet weak private var label: UILabel!
    
    deinit {
        Counter.shared.removeObserver(self, forKeyPath: #keyPath(Counter.count))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "\(Counter.shared.count)"
        Counter.shared.addObserver(self, forKeyPath: #keyPath(Counter.count), options: [.new, .old], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch (keyPath, change?[.newKey] as? Int) {
        case ((#keyPath(Counter.count))?, let newValue?):
            label.text = "\(newValue)"
            
        default:
            break
        }
    }
    
    @IBAction func onPushUp(_ sender: UIButton) {
        Counter.shared.count += 1
    }
    
    @IBAction func onPushDown(_ sender: UIButton) {
        Counter.shared.count = max(0, Counter.shared.count - 1)
    }
    
    @IBAction func onPushPush(_ sender:UIButton) {
        guard  let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

