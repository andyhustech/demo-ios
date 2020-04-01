//
//  MainVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    var tabbar: UITabBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabbar()
    }
    override func viewWillLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 55
        tabFrame.origin.y = self.view.frame.size.height - 55
        self.tabBar.frame = tabFrame
    }
    
    
    func setupTabbar() -> Void {
        
        let newsVC = NewsVC(nibName: "NewsVC", bundle: nil)
        let newsNavi = UINavigationController(rootViewController: newsVC)
        newsVC.title = "News"
        newsVC.tabBarItem.selectedImage = UIImage(named: "news")
        newsVC.tabBarItem.image = UIImage(named: "news")?.withRenderingMode(.alwaysOriginal)
        
        let liveVC = LiveVC(nibName: "LiveVC", bundle: nil)
        let liveNavi = UINavigationController(rootViewController: liveVC)
        liveVC.tabBarItem.selectedImage = UIImage(named: "live")
        liveVC.title = "Live"
        liveVC.tabBarItem.image = UIImage(named: "live")?.withRenderingMode(.alwaysOriginal)
        
        let playersVC = PlayersVC(nibName: "PlayersVC", bundle: nil)
        let playersNavi = UINavigationController(rootViewController: playersVC)
        playersVC.tabBarItem.selectedImage = UIImage(named: "player")
        playersVC.title = "Players"
        playersVC.tabBarItem.image = UIImage(named: "player")?.withRenderingMode(.alwaysOriginal)
        
        
        let techniqueVC = TechniqueVC(nibName: "TechniqueVC", bundle: nil)
        let techniqueNavi = UINavigationController(rootViewController: techniqueVC)
        techniqueVC.title = "Techniques"
        techniqueVC.tabBarItem.selectedImage = UIImage(named: "technique")
        techniqueVC.tabBarItem.image = UIImage(named: "technique")?.withRenderingMode(.alwaysOriginal)
        
        let moreVC = MoreVC(nibName: "MoreVC", bundle: nil)
        let moreNavi = UINavigationController(rootViewController: moreVC)
        moreVC.tabBarItem.selectedImage = UIImage(named: "more")
        moreVC.title = "More"
        moreVC.tabBarItem.image = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        
        
        tabBar.tintColor = hexStringToUIColor(hex: "030405")
        tabBar.barTintColor = hexStringToUIColor(hex: "2597d5")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: hexStringToUIColor(hex: "030405")], for: .selected)
        self.viewControllers = [newsNavi, liveNavi, playersNavi, techniqueNavi, moreNavi]
    }
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
