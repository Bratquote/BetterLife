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
        categoryLabel.isHidden = true
        satisfactionLabel.text = "\(item.satisfaction)"
        importantLabel.text = "\(item.important)"
    }
    
    func initCell(item: WeekItem) {
        //.date!.next(.sunday).getDateString()
        let lastDate = Date(dateString: item.date).next(.sunday, considerToday: false).getDateString()
        nameLabel.text = "с \(item.date) по \(lastDate)"
        categoryLabel.text = ""
        satisfactionLabel.text = "\(item.happiness)"
        importantLabel.text = "\(item.important)"
    }
    

}
