//
//  FactorsListAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class FactorsListAssembler {
    func assemble() -> FactorsListViewController {
        let storyboard = UIStoryboard(name: "FactorsListScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "FactorsListViewController") as! FactorsListViewController
        let router = FactorsListRouter(viewController: viewController)
        let presenter = FactorsListPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
