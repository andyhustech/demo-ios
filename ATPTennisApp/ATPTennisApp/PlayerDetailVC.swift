//
//  PlayerDetailVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/16/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class PlayerDetailVC: CustomNavibar, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var objectModel: PlayersModel? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.webView.delegate = self
        
        let url = (objectModel?.link)!
        print(link)
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.webView.loadRequest(requestWV as URLRequest)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        webView.addGestureRecognizer(swipeLeftRecognizer)
        webView.addGestureRecognizer(swipeRightRecognizer)

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
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(self.webView)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(self.webView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
