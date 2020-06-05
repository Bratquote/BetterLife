//
//  TargetsListPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 31.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class TargetsListPresenter {
    var view: TargetsListViewController
    var router: TargetsListRouter
    
    init(view: TargetsListViewController, router: TargetsListRouter) {
        self.view = view
        self.router = router
    }
    
    func requestList(item: DateItem) {
        var list: [Any] = []
        
        let items = DateItemGenerator().generateKids(item: item)
        
        if item.type == .week {
            if let i = CoreDataWrapper.getWeekList().first(where: {$0.date == item.date!.getDateString()}) {
                list.append("\(i.important),\(i.happiness)")
            } else {
                list.append("\(0),\(0)")
            }
            //list.append("\(0),\(0)")
        }
        
        if item.type == .years || item.type == .year || item.type == .week {
        for i in items {
            list.append(i)
            let coreItems = CoreDataWrapper.getTargetList(type: i.type, date: i.date!)
            for k in coreItems {
                list.append(k)
            }
            list.append(i.date!)
        }
        } else {
            var coreItems = CoreDataWrapper.getTargetList(type: item.type, date: item.date!)
            for k in coreItems {
                list.append(k)
            }
            list.append(item.date!)
        }
        
        
        
        view.updateTableView(list: list)
    }
    
    func openTargetList(item: DateItem) {
        router.openTargetList(item: item)
    }
    
    func openNotes(item: DateItem) {
        router.openNotes(item: item)
    }
    
    func targetCompleted(item: TargetItem) {
        var newItem = item
        newItem.isCompleted.toggle()
        CoreDataWrapper.updateTarget(item: newItem, action: .edit)
    }
    
    func createTarget(item: TargetItem) {
        CoreDataWrapper.updateTarget(item: item, action: .create)
    }
    
    func deleteTarget(item: TargetItem) {
        CoreDataWrapper.updateTarget(item: item, action: .delete)
    }
    
    
    func updateWeekMark(item: DateItem, important: Int, happiness: Int) {
        if let i = CoreDataWrapper.getWeekList().first(where: {$0.date == item.date!.getDateString()}) {
            CoreDataWrapper.updateWeekInfo(item: WeekItem(date: item.date!.getDateString(), important: important, happiness: happiness), action: .edit)
        }
        else {
            CoreDataWrapper.updateWeekInfo(item: WeekItem(date: item.date!.getDateString(), important: important, happiness: happiness), action: .create)
        }
        
    }
}
