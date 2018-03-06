//
//  ViewController.swift
//  FileManagerSample
//
//  Created by 鈴木大貴 on 2016/10/30.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fileURL() -> URL? {
        let urls = FileManager().urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let fileUrl = urls.first else {
            return nil
        }
        
        return fileUrl.appendingPathComponent("save.dat")
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let fileUrl = fileURL() else {
            print("Failed get url.")
            return
        }

        var saveDict: Dictionary = [String:String]()
        saveDict["key1"] = textField1.text
        saveDict["key2"] = textField2.text
        
        if NSKeyedArchiver.archiveRootObject(saveDict, toFile: fileUrl.path) {
            print("Save Success")
        } else {
            print("Failed")
        }
    }
    
    @IBAction func readButtonTapped(_ sender: UIButton) {
        guard let fileUrl = fileURL() else {
            print("Failed get url.")
            return
        }
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            let readDict = NSKeyedUnarchiver.unarchiveObject(withFile: fileUrl.path)
            print(readDict)
        } else {
            print("not exist")
        }
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        guard let fileUrl = fileURL() else {
            print("Failed get url.")
            return
        }
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            do {
                try FileManager.default.removeItem(atPath: fileUrl.path)
                print("Delete Success")
            } catch {
                print("Failed")
            }
        }
    }
}

