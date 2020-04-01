//
//  PhotoVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/20/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class PhotoVC: CustomNavibar, UIWebViewDelegate {

    @IBOutlet weak var photoView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
        self.photoView.delegate = self
        
        let url: String = "http://www.atpworldtour.com/en/photos"
        let requestWV = NSURLRequest(url: NSURL(string: url)! as URL)
        self.photoView.loadRequest(requestWV as URLRequest)
        
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        let swipeRightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(recognizer:)))
        swipeLeftRecognizer.direction = .left
        swipeRightRecognizer.direction = .right
        
        photoView.addGestureRecognizer(swipeLeftRecognizer)
        photoView.addGestureRecognizer(swipeRightRecognizer)

    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        Utils.showProgress(photoView)
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        Utils.hideProgress(photoView)
       
    }
    @objc private func handleSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.direction == .left) {
            if photoView.canGoForward {
                photoView.goForward()
            }
        }
        
        if (recognizer.direction == .right) {
            if photoView.canGoBack {
                photoView.goBack()
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
