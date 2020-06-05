//
//  SWOTStepperCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTStepperCell: UITableViewCell, ComponentCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var importantLabel: UILabel!
    @IBOutlet weak var satisfactionLabel: UILabel!
    @IBOutlet weak var importantStepper: UIStepper!
    @IBOutlet weak var satisfactionStepper: UIStepper!
    
    var object: SWOTCharacteristic!
    var updated: (() -> Void)!
    
    func initCell(item: Any) {
        guard let item = item as? SWOTCharacteristic else { return }
        object = item
        nameLabel.text = item.name
        importantLabel.text = "\(item.important)"
        satisfactionLabel.text = "\(item.happiness)"
        
        setupSteppers()
    }
    
    
    func setupSteppers() {
        importantStepper.maximumValue = 5
        importantStepper.minimumValue = 1
        importantStepper.value = Double(object.important)
        
        satisfactionStepper.maximumValue = 5
        satisfactionStepper.minimumValue = 1
        satisfactionStepper.value = Double(object.happiness)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func importantStepperTapped(_ sender: UIStepper) {
        importantLabel.text = Int(sender.value).description
        object.important = Int(sender.value)
        if let action = updated {
            action()
        }
    }
    @IBAction func satisfactionStepperTapped(_ sender: UIStepper) {
        satisfactionLabel.text = Int(sender.value).description
        object.happiness = Int(sender.value)
        if let action = updated {
            action()
        }
    }
    
}
