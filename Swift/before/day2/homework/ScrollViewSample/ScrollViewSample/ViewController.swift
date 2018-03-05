//
//  ViewController.swift
//  ScrollViewSample
//
//  Created by 鈴木大貴 on 2016/10/25.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scrollView = UIScrollView(frame: view.frame)
        view.addSubview(scrollView)
        
        let image = UIImage(named:"big_image")!
        let scale = UIScreen.main.scale
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let imageView = UIImageView(frame:CGRect(origin: .zero, size: size))
    
        imageView.image = image
        
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.frame.size
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 0.5
        scrollView.delegate = self
        
        scrollView.contentOffset = CGPoint(x: 200, y: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Current content offset is \(scrollView.contentOffset)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for imageView in scrollView.subviews where imageView is UIImageView {
            return imageView
        }
        return nil
    }
}
