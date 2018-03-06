//
//  ViewController.swift
//  WebViewSample
//
//  Created by 岡野 直史 on 2018/03/06.
//  Copyright © 2018年 岡野 直史. All rights reserved.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        ])
        
        let url = URL(string: "https://github.com/apple")!
        let request = URLRequest(url: url)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        print(navigationAction)
        decisionHandler(.allow) // decisionHandlerに.allowを返さないとそこからの処理が進みません
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        super.title = webView.title ?? "no title";
    }
}


