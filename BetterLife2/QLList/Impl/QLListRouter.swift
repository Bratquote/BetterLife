//
//  QLLifeRouter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLListRouter {
    var viewController: QLListViewController
    
    init(viewController: QLListViewController) {
        self.viewController = viewController
    }
    
    func openQLCreate() {
        let vc = QLCreateAssembler().assemble()
        viewController.show(vc, sender: nil)
    }
}
