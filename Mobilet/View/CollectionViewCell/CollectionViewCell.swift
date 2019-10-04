//
//  CollectionViewCell.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var viewModel:CollectionCellViewModel!{
        didSet{
            Intialize()
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func Intialize() {
        self.text.text = viewModel.title
        viewModel.setThumbnailImage(imageView: image)
    }

}
