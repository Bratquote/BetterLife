//
//  WeeksStatisticsAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksStatisticsAssmembler {
    
    func assemble() -> WeeksStatisticsViewController {
        
        let storyboard = UIStoryboard(name: "WeeksStatistics", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WeeksStatisticsViewController") as! WeeksStatisticsViewController
        let router = WeeksStatisticsRouter(view: viewController)
        let presenter = WeeksStatisticsPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        
        return viewController
    }
}
