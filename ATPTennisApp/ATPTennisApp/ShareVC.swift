//
//  ShareVC.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/20/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import Social
class ShareVC: CustomNavibar {

    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
