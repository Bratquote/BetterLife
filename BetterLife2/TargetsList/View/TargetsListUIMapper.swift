//
//  TargetsListUIMapper.swift
//  BetterLife2
//
//  Created by Timur Karimov on 31.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class TargetListUIMapper: BaseUIMapper {
    func registerCells(tableView: UITableView) {
        
    }
    
    func getTableViewCellIdentifier(item: Any) -> String {
        switch item {
        case is DateItem:
            return "TargetHeader"
        case is TargetItem:
            return "TargetCell"
        case is Date:
            return "AddTargetCell"
        default:
           return "TargetHeader"
        }
    }
    
    func mapClick(item: Any, presenter: Any) {
        
    }
    
    
}
