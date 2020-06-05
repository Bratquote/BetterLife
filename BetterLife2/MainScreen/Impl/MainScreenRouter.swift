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
    
    func openCityList() {
        let vc = PlaceToVisitListAssembler().asseble()
        self.viewController.show(vc, sender: nil)
    }
    
    func openPeopleList() {
        let vc = PeopleToRememberAssembler().assemble()
        self.viewController.show(vc, sender: nil)
    }
    
    func openTodayTasks() {
        let vc = TargetsListAssembler().assembler(dateItem: DateItem(type: .week, value: "", parent: nil, date: Date.today().previous(.monday, considerToday: true)))
        self.viewController.show(vc, sender: nil)
    }
    
    func openInstruction() {
        let vc = InstructionAssembler().assemble()
        self.viewController.show(vc, sender: nil)
    }
    
    func openSWOTList() {
        let vc = SWOTListAssembler().assemble()
        self.viewController.show(vc, sender: nil)
    }
}
