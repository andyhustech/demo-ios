//
//  BaseService.swift
//  ATPTennisApp
//
//  Created by QuangMinh on 3/17/17.
//  Copyright © 2017 QuangMinh. All rights reserved.
//

import UIKit
import Alamofire

class BaseService: NSObject {
    func get(_ service: String, parameters: AnyObject, completion:@escaping (_ result: AnyObject, _ object: AnyObject)->Void) ->Void {
        let fullUrl = BaseUrl + service
        Alamofire.request(fullUrl).responseJSON{respone in            
            
            completion(respone.result.value! as AnyObject, "" as AnyObject)
        }
        
    }
}
