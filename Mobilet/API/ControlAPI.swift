//
//  ControlAPI.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias GetListClosure = ([CollectionCellViewModel]?) -> Void

protocol ControlAPI {
    
    func GetListBean(startPage:Int,endPage:Int,completion:@escaping (GetListClosure))->Void
    
}

class ControlService {
    private lazy var httpService = ControlHttpService()
    private init(){}
    static let shared = ControlService()
}

extension ControlService:ControlAPI{
    func GetListBean(startPage:Int,endPage:Int,completion: @escaping (GetListClosure)) {
        DispatchQueue.global(qos: .background).async {
            do{
                try ControlHttpRouter
                    .getList(startPage, endPage)
                    .request(usingHttpService: self.httpService)
                    .responseJSON{ (result) in
                        switch result.result{
                        case .success:
                            do{
                                let json:JSON = try JSON(data: result.data!)
                                var items:[CollectionCellViewModel]? = []
                                for item in json.array ?? []{
                                    items?.append(CollectionCellViewModel(RootClass(fromDictionary: item.dictionaryObject ?? [:])))
                                }
                                completion(items)
                            }catch{
                                completion(nil)
                            }
                            break;
                        case .failure:
                            completion(nil)
                            break
                        }
                }
            }catch(let error){
                print("بروز خطا هنگام دریافت اطلاعات \(error)")
            }
        }
    }
}
