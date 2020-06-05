//
//  NoFactorsCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class NoFactorsCell: UITableViewCell {
    
    
    var addFactor: (() -> Void)!
    var whatIs: (() -> Void)!

    @IBOutlet weak var addFactorButton: UIButton!
    @IBOutlet weak var whatIsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addFactorButton.setRound()
        whatIsButton.setRound()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func whatIsButtonTapped(_ sender: Any) {
        if let action = whatIs {
            action()
        }
        
    }
    @IBAction func addFactorButtonTapped(_ sender: Any) {
        if let action = addFactor {
            action()
        }
    }
}
