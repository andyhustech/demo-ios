//
//  ReadingNewsVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class ReadingNewsVC: CustomNavibar, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    
    var objectModel: NewsModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.webView.delegate = self
        
        let url = (objectModel?.url)!
        let requesWV = URLRequest(url: URL(string: url)!)
        self.webView.loadRequest(requesWV)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        webView.addGestureRecognizer(swipeLeftRecognizer)
        webView.addGestureRecognizer(swipeRightRecognizer)

    }
    
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(self.webView)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(self.webView)
    }
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if webView.canGoForward {
                webView.goForward()
            }
        }
        
        if (recognizer.direction == .right) {
            if webView.canGoBack {
                webView.goBack()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
