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
    
    var object: QLItem!
    
    func initCell(item: Any) {
        guard let item = item as? QLItem else { return }
        object = item
        nameLabel.text = item.name
        importantLabel.text = "3"
        satisfactionLabel.text = "3"
        
        setupSteppers()
    }
    
    
    func setupSteppers() {
        importantStepper.maximumValue = 5
        importantStepper.minimumValue = 1
        importantStepper.value = 3
        
        satisfactionStepper.maximumValue = 5
        satisfactionStepper.minimumValue = 1
        satisfactionStepper.value = 3
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
    }
    @IBAction func satisfactionStepperTapped(_ sender: UIStepper) {
        satisfactionLabel.text = Int(sender.value).description
        object.satisfaction = Int(sender.value)
    }
    
}
