//
//  PlayersService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 5/16/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit

class PlayersService: BaseService {
    var listPlayersService: NSMutableArray = []
    var listId: [String] = []
    var listName: [String] = []
    
    func requestPlayersFromServer(_ completion: @escaping (_ result: AnyObject, _ object: AnyObject) -> Void) -> Void{
        
        self.get(playersService, parameters: "" as AnyObject) { (result, object) in
            
            let modelList = PlayersModelList()
            modelList.initWithDictionary(dict: result as! NSDictionary)
            
            for object in modelList.data{
                let model = PlayersModel()
                model.initWithDictionary(dict: object as! NSDictionary)
                self.listPlayersService.add(model)
                self.listId.append(model.id)
                self.listName.append(model.name)
            }
            completion("" as AnyObject, "" as AnyObject)
        }
        
    }
    
}
