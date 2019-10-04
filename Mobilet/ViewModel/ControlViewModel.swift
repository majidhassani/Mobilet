//
//  ControlViewModel.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import RxSwift

class ControlViewModel {
    
    
    private let itemListVaribale = BehaviorSubject<[CollectionCellViewModel]?>(value: nil)
    var resiveItemList:Observable<[CollectionCellViewModel]?>{
        return itemListVaribale.asObservable()
    }
    
    private let internetConnectionFieldVaribale = BehaviorSubject<Bool?>(value: nil)
    var internetConnectionField:Observable<Bool?>{
        return internetConnectionFieldVaribale.asObservable()
    }
    
    func getList(_ startPage:Int,_ endPage:Int){
        NetworkManager.isReachable { networkManagerInstance in
            ControlService.shared.GetListBean(startPage: startPage, endPage: endPage)
            {result in
                DispatchQueue.main.async(execute: {
                    self.itemListVaribale.onNext(result)
                })
            }
            
        }
        NetworkManager.isUnreachable { networkManagerInstance in
            self.internetConnectionFieldVaribale.onNext(true)
        }
    }
}
