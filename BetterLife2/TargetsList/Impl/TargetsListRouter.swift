//
//  TargetsListRouter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 31.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class TargetsListRouter {
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func openTargetList(item: DateItem) {
        let vc = TargetsListAssembler().assembler(dateItem: item)
        viewController.show(vc, sender: nil)
    }
    
    func openNotes(item: DateItem) {
        let vc = NotesAssembler().assemble(item: item)
        viewController.show(vc, sender: nil)
    }

}
