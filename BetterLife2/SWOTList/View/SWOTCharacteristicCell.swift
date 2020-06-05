//
//  SWOTCharacteristicCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTCharacteristicCell: UICollectionViewCell {
    
    @IBOutlet weak var happinessLabel: UILabel!
    @IBOutlet weak var importantLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    
    func initCell(item: SWOTCharacteristic) {
        textLabel.text = item.name
        happinessLabel.text = "\(item.happiness)"
        importantLabel.text = "\(item.important)"
        self.setRound()
    }
}
