//
//  NoQLCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 18.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class NoQLCell: UITableViewCell {

  
    @IBOutlet weak var whatIsQLButton: UIButton!
    @IBOutlet weak var addQLButton: UIButton!
    
    var createQL: (() -> Void)!
    var whatIsQL: (() -> Void)!
    
    override func awakeFromNib() {
          super.awakeFromNib()
        whatIsQLButton.setRound()
        addQLButton.setRound()
        whatIsQLButton.backgroundColor = Defaults.mainColor
      }

    @objc func whatIsTapped() {
        if let action = whatIsQL {
            action()
        }
    }

    @IBAction func whatIsButtonTapped(_ sender: Any) {
        if let action = whatIsQL {
            action()
        }
    }
    
    @IBAction func addQLButtonTapped(_ sender: Any) {
        if let action = createQL {
            action()
        }
    }
}
