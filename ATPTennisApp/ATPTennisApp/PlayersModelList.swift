//
//  PlayersModelList.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/16/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class PlayersModelList: NSObject {
    var code: String = ""
    var message: String = ""
    var data : NSArray = []
    
    func initWithDictionary(dict: NSDictionary){
        self.code = "\(dict.object(forKey: "code") as! String)"
        self.message = dict.object(forKey: "message") as! String
        self.data = dict.object(forKey: "data") as! NSArray
    }
}
