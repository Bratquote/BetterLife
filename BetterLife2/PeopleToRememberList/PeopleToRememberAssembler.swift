//
//  PeopleToRememberAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


class PeopleToRememberAssembler {
    func assemble() -> PeopleToRememberViewController {
        let storyboard = UIStoryboard(name: "PeopleToRemember", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PeopleToRememberViewController") as! PeopleToRememberViewController
        
        let router = PeopleToRememberRouter(view: viewController)
        let interactor = PeopleToRememberInteractor()
        let presenter = PeopleToRememberPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
