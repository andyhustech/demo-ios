//
//  TechModel.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/7/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class BackhandModel: NSObject {
    var id: String = ""
    var name: String = ""
    var flag: String = ""
    var avatar: String = ""
    var link: String = ""

    
    func initWithDictionary(dict: NSDictionary){
        self.id = dict.object(forKey: "id") as! String
        self.name = dict.object(forKey: "name") as! String
        self.flag = dict.object(forKey: "flag") as! String
        self.avatar = dict.object(forKey: "avatar") as! String
        self.link = dict.object(forKey: "link") as! String
        
    }
    
}
