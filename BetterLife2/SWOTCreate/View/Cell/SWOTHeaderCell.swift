//
//  SWOTHeaderCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTHeaderCell: UITableViewCell, ComponentCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    
    func initCell(item: Any) {
        guard let item = item as? HeaderItem else {return}
        headerLabel.text = item.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
