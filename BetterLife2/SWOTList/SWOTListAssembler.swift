//
//  SWOTListAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTListAssembler {
    func assemble() -> SWOTListViewController {
        
        let storyboard = UIStoryboard(name: "SWOTList", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SWOTListViewController") as! SWOTListViewController
        
        let presetner = SWOTListPresenter(view: viewController)
        viewController.presenter = presetner
        
        return viewController
    }
}
