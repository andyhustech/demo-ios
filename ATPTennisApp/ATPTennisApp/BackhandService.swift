//
//  TechService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/7/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class BackhandService: BaseService {
    var listBackhandService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestBackhandFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(backhandService, parameters: "" as AnyObject) { (result, object) in
            
            let modelList = BackhandModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = BackhandModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listBackhandService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
        
    }
    
}

