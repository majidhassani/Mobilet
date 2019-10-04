//
//  ControlHttpRouter.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum ControlHttpRouter{
    case getList(_ startPage:Int,_ endPage:Int)
}

extension ControlHttpRouter:HttpRouter{
    
    var baseUrlString: String {
        return Constants.BASE_URL
    }
    
    var path: String {
        switch self {
            case .getList(let startPage, let endPage):
                return "\(startPage)-\(endPage)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json;charset=UTF-8"]
    }
    
}
