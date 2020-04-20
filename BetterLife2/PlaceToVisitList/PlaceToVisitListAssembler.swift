//
//  PlaceToVisitListAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class PlaceToVisitListAssembler {
    
    func asseble() -> PlaceToVisitListViewController {
        let storyboard = UIStoryboard(name: "PlaceToVisitListScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "PlaceToVisitListViewController") as! PlaceToVisitListViewController
        let router = PlaceToVisitListRouter(viewController: viewController)
        let presenter = PlaceToVisitListPresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
