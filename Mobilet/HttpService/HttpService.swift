//
//  HttpService.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import Alamofire

protocol HttpService {
    
    var sessionManager: Session { get set }
    func request(_ urlRequest:URLRequestConvertible) -> DataRequest
    
}
