//
//  CustomNavibar.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class CustomNavibar: UIViewController {

    var pressSearch: ((AnyObject) -> ())?
    
    func customNavigationBar() -> Void {
        let nav = self.navigationController?.navigationBar
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let imag: UIImage = UIImage(named: "topimg")!
        let imagV = UIImageView(image: imag)
        imagV.contentMode = .scaleAspectFit
        
        
        nav?.setBackgroundImage(imagV.image, for: .default)
        let imageV = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let image = UIImage(named: "logo")
        imageV.image = image
        
        navigationItem.titleView = imageV
    }
    
    func customNaviSearchButton() -> Void {
        let buttonSearch = UIBarButtonItem(image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(CustomNavibar.searchAction(_:)))
        
        self.navigationItem.rightBarButtonItem = buttonSearch
    }
    func searchAction(_ sender: UIBarButtonItem) -> Void {
        if pressSearch != nil {
            self.pressSearch!(sender)
        }
    }
}
