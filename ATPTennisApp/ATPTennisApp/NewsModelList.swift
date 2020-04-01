//
//  NewsModelList.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class NewsModelList: NSObject {
    var code: String = ""
    var message: String = ""
    var data : NSArray = []
    
    func initWithDictionary(dict: NSDictionary){
        self.code = "\(dict.object(forKey: "code") as! NSNumber)"
        self.message = dict.object(forKey: "message") as! String
        self.data = dict.object(forKey: "data") as! NSArray
    }
}
