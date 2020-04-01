//
//  PlayersModel.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/16/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class PlayersModel: NSObject {
    var id: String = ""
    var name: String = ""
    var link: String = ""
    
    func initWithDictionary(dict: NSDictionary){
        self.id = dict.object(forKey: "id") as! String
        self.name = dict.object(forKey: "name") as! String
        self.link = dict.object(forKey: "link") as! String
    }
    
}

