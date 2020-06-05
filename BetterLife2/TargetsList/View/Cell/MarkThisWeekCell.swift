//
//  MarkThisWeekCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class MarkThisWeekCell: UITableViewCell {
    
    
    @IBOutlet weak var importantValueSC: UISegmentedControl!
    @IBOutlet weak var happyValueSC: UISegmentedControl!
    
    var updateValue: (() -> (Void))!
    var iValue: Int = -1
    var hValue: Int = -1
    
    func initCell(value: String) {
        let importantValue = Int(value.split(separator: ",")[0])!
        let happyValue = Int(value.split(separator: ",")[1])!
        
        if importantValue != 0 {
        importantValueSC.selectedSegmentIndex = importantValue-1
        } else {
            importantValueSC.selectedSegmentIndex = UISegmentedControl.noSegment
        }
        if happyValue != 0 {
        happyValueSC.selectedSegmentIndex = happyValue-1
        } else {
            happyValueSC.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }

    
    func segmentedControlChanged() {
         iValue = importantValueSC.selectedSegmentIndex
         hValue = happyValueSC.selectedSegmentIndex
        
        if let action = updateValue {
            action()
            
        }
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func importantValueChanged(_ sender: Any) {
        segmentedControlChanged()
    }
    
    @IBAction func happyValueChanged(_ sender: Any) {
        segmentedControlChanged()
    }
    
}
