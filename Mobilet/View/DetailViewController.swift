//
//  DetailViewController.swift
//  Mobilet
//
//  Created by saeed on 10/4/19.
//  Copyright © 2019 Majid Hassani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var viewModel:CollectionCellViewModel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.text.text = self.viewModel.title
        self.viewModel.setImage(imageView: self.image)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
