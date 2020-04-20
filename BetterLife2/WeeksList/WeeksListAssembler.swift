//
//  WeeksListAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 07.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


class WeeksListAssembler {
    
    func assemble() -> WeeksListViewController {
        let storyboard = UIStoryboard(name: "WeeksList", bundle: Bundle.main)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "WeeksListViewController") as! WeeksListViewController
        let router = WeeksListRouter(viewController: viewController)
        let presenter = WeeksListPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
