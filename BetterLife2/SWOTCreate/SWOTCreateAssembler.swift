//
//  SWOTCreateAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTCreateAssembler {
    func assemble() -> SWOTCreateViewController {
        let storyboard = UIStoryboard(name: "SWOTCreateScreen", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SWOTCreateViewController") as! SWOTCreateViewController
        
        let router = SWOTCreateRouter(viewController: viewController)
        let presenter = SWOTCreatePresenter(view: viewController, router: router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
