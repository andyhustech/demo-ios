//
//  ServeService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/11/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class ServeService: BaseService {
    var listServeService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestServeFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(serveService, parameters: "" as AnyObject) { (result, object) in
            
      //      print("result \(result)")
            
            let modelList = ServeModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = ServeModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listServeService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
        
    }
    
}


