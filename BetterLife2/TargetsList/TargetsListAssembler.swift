//
//  TargetsListAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class TargetsListAssembler {
    
    func assembler(dateItem: DateItem) -> TargetsListViewController {
        let storyboard = UIStoryboard(name: "TargetsList", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TargetsListViewController") as! TargetsListViewController
        
        let router = TargetsListRouter(viewController: viewController)
        let presenter = TargetsListPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        viewController.dateItem = dateItem
        
        return viewController
    }
}
