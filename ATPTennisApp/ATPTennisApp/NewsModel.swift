//
//  NewsModel.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class NewsModel: NSObject {
    var id: String = ""
    var title: String = ""
    var url: String = ""
    var imgurl: String = ""
    var language: String = ""
    
    func initWithDictionary(dict: NSDictionary){
        self.id = dict.object(forKey: "id") as! String
        self.title = dict.object(forKey: "title") as! String
        self.url = dict.object(forKey: "url") as! String
        self.imgurl = dict.object(forKey: "imgurl") as! String
        self.language = dict.object(forKey: "language") as! String
    }
    
}
