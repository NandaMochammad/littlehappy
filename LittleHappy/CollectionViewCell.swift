//
//  CollectionViewCell.swift
//  LittleHappy
//
//  Created by I Putu Krisna on 24/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.cellView.layer.shadowColor = UIColor.gray.cgColor
            self.cellView.layer.shadowOpacity = 0.5
            self.cellView.layer.shadowOpacity = 10
            self.cellView.layer.shadowOffset = .zero
            self.cellView.layer.shadowPath = UIBezierPath(rect: self.cellView.bounds).cgPath
            self.cellView.layer.shouldRasterize = true
        }
    }

//    @IBAction func cellButton(_ sender: UIButton) {
//
//    }
}
