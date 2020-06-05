//
//  WeeksTotalAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksTotalAssembler {
    
    func assemble() -> WeeksTotalViewController {
        let storyboard = UIStoryboard(name: "WeeksTotal", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WeeksTotalViewController") as! WeeksTotalViewController
        
        let router = WeeksTotalRouter(view: viewController)
        let presenter = WeeksTotalPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
}
