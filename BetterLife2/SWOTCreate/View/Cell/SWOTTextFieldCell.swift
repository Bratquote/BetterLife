//
//  SWOTTextFieldCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTTextFieldCell: UITableViewCell, ComponentCell {

    
    @IBOutlet weak var textField: UITextField!
    
    func initCell(item: Any) {
        guard let item = item as? TextFieldItem else { return }
        textField.placeholder = item.placeHolder
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
