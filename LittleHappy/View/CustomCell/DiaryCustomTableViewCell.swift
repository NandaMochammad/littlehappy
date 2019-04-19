//
//  DiaryCustomTableViewCell.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 18/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class DiaryCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundDiary: UIView!
    
    @IBOutlet weak var iconDiary: UIImageView!
    
    @IBOutlet weak var feelDiary: UILabel!
    
    @IBOutlet weak var dateDiary: UILabel!
    
    @IBOutlet weak var timeDiary: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
