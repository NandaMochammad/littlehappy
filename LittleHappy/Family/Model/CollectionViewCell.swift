//
//  CollectionVC.swift
//  LittleHappy
//
//  Created by I Putu Krisna on 24/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOpacity = 10
        self.layer.shadowOffset = .zero
        self.layer.shadowPath = UIBezierPath(rect: self.layer.bounds).cgPath
        self.layer.shouldRasterize = true
    }
}
