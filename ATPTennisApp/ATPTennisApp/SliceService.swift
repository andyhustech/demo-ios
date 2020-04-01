//
//  SliceService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/11/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class SliceService: BaseService {
    var listSliceService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestSliceFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(sliceService, parameters: "" as AnyObject) { (result, object) in
            
      //      print("result \(result)")
            
            let modelList = SliceModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = SliceModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listSliceService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
        
    }
    
}


