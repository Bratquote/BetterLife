//
//  BaseUIMapper.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

protocol BaseUIMapper {
    func registerCells(tableView: UITableView)
    
    func getTableViewCellIdentifier(item: Any) -> String
    
    func mapClick(item: Any, presenter: Any)
}
