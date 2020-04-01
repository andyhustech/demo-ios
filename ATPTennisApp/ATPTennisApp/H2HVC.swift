//
//  H2HVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class H2HVC: CustomNavibar, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.webView.delegate = self
        webView.scalesPageToFit = true
        webView.contentMode = .scaleAspectFit
        let url: String = "http://tennis-strangeforest.rhcloud.com/headToHead"
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.webView.loadRequest(requestWV as URLRequest)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        webView.addGestureRecognizer(swipeLeftRecognizer)
        webView.addGestureRecognizer(swipeRightRecognizer)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(webView)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(webView)
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
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
