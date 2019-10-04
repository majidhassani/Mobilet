//
//  CollectionViewModelCell.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionCellViewModel {
    
    var id : Int
    var thumbnailUrl : String
    var title : String
    var url : String
    
    init(_ item:RootClass) {
        self.id = item.id
        self.thumbnailUrl = item.thumbnailUrl
        self.title = item.title
        self.url = item.url
    }
    
    func setThumbnailImage(imageView:UIImageView) {
        imageView.sd_setImage(with: URL(string: self.thumbnailUrl), placeholderImage: UIImage(named: "image.png"))
    }
    
    func setImage(imageView:UIImageView) {
        imageView.sd_setImage(with: URL(string: self.url), placeholderImage: UIImage(named: "image.png"))
    }
    
}
