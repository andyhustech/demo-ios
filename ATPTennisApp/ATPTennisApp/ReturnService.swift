//
//  ReturnService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/11/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class ReturnService: BaseService {
    var listReturnService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestReturnFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(returnService, parameters: "" as AnyObject) { (result, object) in
            
          //  print("result \(result)")
            
            let modelList = ReturnModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = ReturnModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listReturnService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
        
    }
    
}


