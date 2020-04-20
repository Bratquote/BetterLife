//
//  SWOTCreateButtonCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTCreateButtonCell: UITableViewCell, ComponentCell {
    
    var action: (() -> Void)?
    
    func initCell(item: Any) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func createButtonTapped(_ sender: Any) {
        if let action = action {
            action()
        }
    }
}
