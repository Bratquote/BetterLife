//
//  QLLifeAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLListAssembler {
    func assemble() -> QLListViewController {
        let storyboard = UIStoryboard(name: "QLLifeScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "QLListViewController") as! QLListViewController
        let router = QLListRouter(viewController: viewController)
        let presenter = QLListPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
