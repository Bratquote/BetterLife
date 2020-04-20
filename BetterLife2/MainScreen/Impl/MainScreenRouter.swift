//
//  MainScreenRouter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 19.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class MainScreenRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func openCreateSWOT() {
        let vc = SWOTCreateAssembler().assemble()
        self.viewController.show(vc, sender: nil)
    }
}
