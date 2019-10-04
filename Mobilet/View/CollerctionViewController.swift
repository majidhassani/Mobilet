//
//  FirstViewController.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import UIKit
import RxSwift

class CollerctionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    let disposeBag = DisposeBag()
    private let refreshControl = UIRefreshControl()
    let viewModel:ControlViewModel = ControlViewModel()
    var startPage:Int = 1
    var endPage:Int = 10
    var loadMore:Bool = true
    var selectedPath:Int = 0
    
    @IBOutlet weak var collectionViewCellLayout: UICollectionViewFlowLayout!{
        didSet{
            collectionViewCellLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var items:[CollectionCellViewModel]?!{
        didSet{
            guard  self.items != nil else {
                return
            }
            let max:Int = self.items!.map{ $0.id }.max() ?? 0
            let min:Int = self.items!.map{ $0.id }.min() ?? 0
            guard max > 0 else {
                return
            }
            if max % 10 == 0{
                self.loadMore = true
                self.startPage = min + 10
                self.endPage = max + 10
            }else{
                self.loadMore = false
            }
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observes()
        viewModel.getList(startPage, endPage)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    
        
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard self.items != nil else {
            return 0
        }
        return self.items!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.viewModel = items?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPath = indexPath.row
        self.performSegue(withIdentifier: Constants.DETAIL_PAGE, sender: self)
    }
   
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastSectionIndex = collectionView.numberOfSections - 1
        let lastRowIndex = collectionView.numberOfItems(inSection: lastSectionIndex) - 1
        if  indexPath.row == lastRowIndex && self.loadMore == true{
           
            self.viewModel.getList(startPage, endPage)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailViewController{
            let controller:DetailViewController = segue.destination as! DetailViewController
            controller.viewModel = self.items![self.selectedPath]
        }
    }
    
    func Observes(){
        observeAccounts()
        observeInternetConnection()
    }
    
    private func observeAccounts(){
        viewModel.resiveItemList.subscribe({[weak self] reciveObject in
            guard reciveObject.element != nil && reciveObject.element! != nil else{
                return
            }
            self?.items = reciveObject.element as? [CollectionCellViewModel]
        }).disposed(by: disposeBag)
    }
    
    private func observeInternetConnection(){
        viewModel.internetConnectionField.subscribe({[weak self] reciveObject in
            guard reciveObject.element != nil && reciveObject.element! != nil else{
                return
            }
            self?.showMessage(Constants.ALERT, Constants.INTERNET_CONECTION_FAILD)
            
        }).disposed(by: disposeBag)
    }
}

