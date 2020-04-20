//
//  WeeksListRouter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 07.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksListRouter {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func openTargetList(item: DateItem) {
        print(item)
        let vc = TargetsListAssembler().assembler(dateItem: item)
        viewController.show(vc, sender: nil)
    }
}
