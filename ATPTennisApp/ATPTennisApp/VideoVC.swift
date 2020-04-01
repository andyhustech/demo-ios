//
//  VideoVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/20/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class VideoVC: CustomNavibar, UIWebViewDelegate {

    @IBOutlet weak var videoView: UIWebView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.videoView.delegate = self
        
        let url: String = "http://www.atpworldtour.com/en/video"
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.videoView.loadRequest(requestWV as URLRequest)
        
            let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
            let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
            swipeLeftRecognizer.direction = .left
            swipeRightRecognizer.direction = .right
            
            videoView.addGestureRecognizer(swipeLeftRecognizer)
            videoView.addGestureRecognizer(swipeRightRecognizer)
            
        }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(videoView)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(videoView)
        
    }
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if videoView.canGoForward {
                videoView.goForward()
            }
        }
        
        if (recognizer.direction == .right) {
            if videoView.canGoBack {
                videoView.goBack()
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
