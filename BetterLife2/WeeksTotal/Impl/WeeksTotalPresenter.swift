//
//  WeeksTotalPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class WeeksTotalPresenter {
    
    var view: WeeksTotalViewController
    var router: WeeksTotalRouter
    
    init(view: WeeksTotalViewController, router: WeeksTotalRouter) {
        self.view = view
        self.router = router
    }
    
    func requestList() {
        let dateList: [DateItem] = DateItemGenerator().generateWeeks()
        let weekList: [WeekItem] = CoreDataWrapper.getWeekList()
        var list: [WeekItem] = []
        
        for i in dateList {
            if let d = weekList.first(where: {$0.date == i.date!.getDateString()}) {
            //let k = QLItem(id: nil, name: name, satisfaction: 4, important: 3, category: .none, comment: "Кек")
            list.append(d)
            } else {
                list.append(WeekItem(date: i.date!.getDateString(), important: 0, happiness: 0))
            }
        }
        
        view.updateList(list, dateList: dateList)
    }
    
    func openWeekInfo(item: DateItem) {
        router.openWeekInfo(item: item)
    }
}
