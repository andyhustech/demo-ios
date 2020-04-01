//
//  ForehandService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/11/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class ForehandService: BaseService {
    var listForehandService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestForehandFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(forehandService, parameters: "" as AnyObject) { (result, object) in
            
       print("result \(result)")
            
            let modelList = ForehandModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = ForehandModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listForehandService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
        
    }
    
}


