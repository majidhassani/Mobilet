//
//  HttpRouter.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import Alamofire

protocol HttpRouter: URLRequestConvertible {
    var baseUrlString:String{ get }
    var path:String { get }
    var method:HTTPMethod { get }
    var headers:HTTPHeaders? { get }
    var parameters:Parameters? { get }
    func body() throws -> Data?
    func request(usingHttpService service:HttpService) throws -> DataRequest
    
}

extension HttpRouter{
    
    var parameters:Parameters? { return nil }
    func body() throws -> Data?{ return nil }
    
    func asURLRequest() throws -> URLRequest {
        var url = try baseUrlString.asURL()
        url.appendPathComponent(path)
        var request = try URLRequest(url: url, method: method)
        request.headers = headers!
        request.httpBody = try body()
        return request
    }
    
    func request(usingHttpService service:HttpService) throws -> DataRequest{
        return try service.request(asURLRequest())
    }
    
}
