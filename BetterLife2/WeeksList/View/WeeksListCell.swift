//
//  WeeksListCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 07.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksListCell: UITableViewCell {

    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
