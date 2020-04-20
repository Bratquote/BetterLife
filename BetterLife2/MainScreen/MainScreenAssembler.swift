//
//  MainScreenAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 19.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class MainScreenAssembler {
    func assemble() -> MainScreenViewController {
        
        let storyboard = UIStoryboard(name: "MainScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainScreenViewController") as! MainScreenViewController
        let router = MainScreenRouter(viewController: viewController)
        let presenter = MainScreenPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
