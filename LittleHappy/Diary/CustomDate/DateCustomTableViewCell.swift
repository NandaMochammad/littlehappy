//
//  DateCustomTableViewCell.swift
//  LittleHappy
//
//  Created by Nanda Mochammad on 23/04/19.
//  Copyright © 2019 littlehappy. All rights reserved.
//

import UIKit

class DateCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
