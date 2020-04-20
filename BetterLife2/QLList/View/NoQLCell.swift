//
//  NoQLCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 18.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class NoQLCell: UITableViewCell {

  
    @IBOutlet weak var whatIsQLButton: UILabel!
    
    
    var createQL: (() -> Void)!
    var whatIsQL: (() -> Void)!
    
    override func awakeFromNib() {
          super.awakeFromNib()
        whatIsQLButton.setRound()
        whatIsQLButton.setDefaulColor()
        let whatIsTap = UITapGestureRecognizer(target: self, action: #selector(self.whatIsTapped))
        whatIsQLButton.addGestureRecognizer(whatIsTap)
//        vkImage.addGestureRecognizer(vkTap)
//        vkImage.isUserInteractionEnabled = true
      }

    @objc func whatIsTapped() {
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
