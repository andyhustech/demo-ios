//
//  BackhandDetailVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/7/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class BackhandDetailVC: CustomNavibar {

    @IBOutlet var videoView: UIView!
   
    var objectModel: BackhandModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()
    }
    func playVideo(url: NSURL){
        let player = AVPlayer(url: url as URL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
        
        player.play()
    }
    override func viewDidAppear(_ animated: Bool) {
        let fileURL = NSURL(string: (objectModel?.link)!)!
        playVideo(url: fileURL)
        
    }
}
