//
//  RankingVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/20/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class RankingVC: CustomNavibar, UIWebViewDelegate {
    @IBOutlet weak var rankingView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.rankingView.delegate = self
        
        let url: String = "http://tennis-strangeforest.rhcloud.com/rankingsTable"
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.rankingView.loadRequest(requestWV as URLRequest)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        rankingView.addGestureRecognizer(swipeLeftRecognizer)
        rankingView.addGestureRecognizer(swipeRightRecognizer)
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(rankingView)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(rankingView)
    }
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if rankingView.canGoForward {
                rankingView.goForward()
            }
        }
        
        if (recognizer.direction == .right) {
            if rankingView.canGoBack {
                rankingView.goBack()
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
