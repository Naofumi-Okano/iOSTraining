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
    
    lazy var backButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(ViewController.backButtonTapped(_:)))
    }()
    lazy var forwardButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(ViewController.forwardButtonTapped(_:)))
    }()
    lazy var relaodButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Relaod", style: .plain, target: self, action: #selector(ViewController.reloadButtonTapped(_:)))
    }()


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
        
        navigationController?.isToolbarHidden = false
        backButton.isEnabled = false
        forwardButton.isEnabled = false
        toolbarItems = [backButton, forwardButton, relaodButton]
        
        [
            #keyPath(WKWebView.canGoBack),
            #keyPath(WKWebView.canGoForward),
            #keyPath(WKWebView.title)
            ].forEach { keyPath in
                webView.addObserver(self, forKeyPath: keyPath, options: [.new, .old], context: nil)
        }
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        switch (keyPath, change?[.newKey], change?[.oldKey]) {
        case ((#keyPath(WKWebView.canGoBack))?, let newVal as Bool, let oldVal as Bool) where newVal != oldVal:
            backButton.isEnabled =  newVal
            
        case ((#keyPath(WKWebView.canGoForward))?, let newVal as Bool, let oldVal as Bool) where newVal != oldVal:
            forwardButton.isEnabled =  newVal
            
        case ((#keyPath(WKWebView.title))?, let newVal as String, let oldVal as String) where newVal != oldVal:
            title = newVal
            
        default:
            break
        }
    }
    @objc func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @objc func forwardButtonTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @objc func reloadButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
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


