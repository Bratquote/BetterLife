//
//  SWOTUIMapper.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


class SWOTUIMapper: BaseUIMapper {
    func registerCells(tableView: UITableView) {
        
    }
    
    func getTableViewCellIdentifier(item: Any) -> String {
        switch item {
        case is HeaderItem:
            return "SWOTHeaderCell"
        case is TextFieldItem:
            return "SWOTTextFieldCell"
        case is SWOTCharacteristic:
            return "SWOTStepperCell"
        case is String:
            return "SWOTCreateButtonCell"
        default:
            return ""
        }
    }
    
    func mapClick(item: Any, presenter: Any) {
        
    }
    
    
}
