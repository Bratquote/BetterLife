//
//  QLCreateAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLCreateAssembler {
    func assemble(item: QLItem? = nil) -> QLCreateViewController {
        let storyboard = UIStoryboard(name: "QLCreateScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "QLCreateViewController") as! QLCreateViewController
        let router = QLCreateRouter(viewController: viewController)
        let presenter = QLCreatePresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        viewController.oldItem = item
        return viewController
    }
}
