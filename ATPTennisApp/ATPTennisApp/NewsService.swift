//
//  NewsService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class NewsService: BaseService {
    var listNewsService: NSMutableArray = []
    var listLanguage: [String] = []
    var listId: [String] = []
    
    func requestNewsFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(newsService, parameters: "" as AnyObject) { (result, object) in
            
            let modelList = NewsModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = NewsModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listNewsService.add(model)
                self.listLanguage.append(model.language)
                self.listId.append(model.id)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
    }
    
}
