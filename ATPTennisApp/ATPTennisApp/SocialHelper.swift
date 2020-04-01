//
//  SocialHelper.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/21/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import MessageUI
import Social
class SocialHelper: NSObject {
    class func shareOnFacebook(viewController:UIViewController, title:String, linkURL:String) -> Void {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText(title);
            facebookSheet.add(NSURL(string: linkURL) as URL!);
            facebookSheet.add(UIImage(named: "AppIcon"));
            facebookSheet.completionHandler = {
                result -> Void in
                viewController.dismiss(animated: true, completion: { () -> Void in
                    viewController.navigationController?.popToRootViewController(animated: true)
                })
            }
            
            viewController.present(facebookSheet, animated: true, completion: nil)
            
        }
        else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}

//    class func jumpToAppStore(appId: String) {
//        let url = "itms-apps://itunes.apple.com/app/id\(appId)"
//        UIApplication.shared.openURL(NSURL(string: url)! as URL)
//    }
    



