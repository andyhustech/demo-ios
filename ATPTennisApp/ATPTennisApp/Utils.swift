//
//  Utils.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import Foundation
import MBProgressHUD
import SDWebImage
import SVPullToRefresh
class Utils: NSObject {
    static let shareInstance = Utils()
    
    
    class func showProgress(_ view: UIView) {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    class func hideProgress(_ view: UIView) {
        MBProgressHUD.hideAllHUDs(for: view, animated: true)
    }
    
}
