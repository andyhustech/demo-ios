//
//  TourVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class TourVC: CustomNavibar, UIWebViewDelegate {
    
    @IBOutlet weak var liveView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.liveView.delegate = self
        
        let url: String = "http://www.atpworldtour.com/en/tournaments"
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.liveView.loadRequest(requestWV as URLRequest)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        liveView.addGestureRecognizer(swipeLeftRecognizer)
        liveView.addGestureRecognizer(swipeRightRecognizer)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(liveView)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(liveView)
    }
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if liveView.canGoForward {
                liveView.goForward()
            }
        }
        
        if (recognizer.direction == .right) {
            if liveView.canGoBack {
                liveView.goBack()
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
