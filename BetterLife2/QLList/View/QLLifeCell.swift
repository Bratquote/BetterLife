//
//  QLLifeCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLLifeCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var satisfactionLabel: UILabel!
    @IBOutlet weak var importantLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initCell(item: QLItem) {
        nameLabel.text = item.name
        categoryLabel.text = item.category.rawValue
        satisfactionLabel.text = "\(item.satisfaction)"
        importantLabel.text = "\(item.important)"
    }
    

}
