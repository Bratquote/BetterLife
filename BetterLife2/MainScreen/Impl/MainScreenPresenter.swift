//
//  MainScreenPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 19.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


class MainScreenPresenter {
    var view: MainScreenViewController
    var router: MainScreenRouter
    
    init(view: MainScreenViewController, router: MainScreenRouter) {
        self.view = view
        self.router = router
    }
    func requestList() {
        var list: [Any] = CoreDataWrapper.getTargetList(type: .day, date: Date(noTime: true))
        list.append(Date(noTime: true))
        
        view.updateTableView(list: list)
    }
    
    func createTarget(item: TargetItem) {
        CoreDataWrapper.updateTarget(item: item, action: .create)
    }
    
    func targetCompleted(item: TargetItem) {
        var newItem = item
        newItem.isCompleted.toggle()
        CoreDataWrapper.updateTarget(item: newItem, action: .edit)
    }
    
    func openCreateSWOT() {
        router.openCreateSWOT()
    }
    
    func openCityList() {
        router.openCityList()
    }
    
    func openPeopleList() {
        router.openPeopleList()
    }
    
    func openTodayTasks() {
        router.openTodayTasks()
    }
    
    func openInstruction() {
        router.openInstruction()
    }
    
    func openSWOTList() {
        router.openSWOTList()
    }
}
