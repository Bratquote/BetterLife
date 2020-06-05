//
//  WeeksStatisticsPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class WeeksStatisticsPresenter {
    var view: WeeksStatisticsViewController
    var router: WeeksStatisticsRouter
    
    init(view: WeeksStatisticsViewController, router: WeeksStatisticsRouter) {
        self.view = view
        self.router = router
    }
    
    func requestList() {
        let dateList: [DateItem] = DateItemGenerator().generateWeeks()
               let weekList: [WeekItem] = CoreDataWrapper.getWeekList()
               var list: [WeekItem] = []
               
               for i in dateList {
                   if let d = weekList.first(where: {$0.date == i.date!.getDateString()}) {
                   list.append(d)
                   } else {
                       list.append(WeekItem(date: i.date!.getDateString(), important: 0, happiness: 0))
                   }
               }
               
        view.updateList(list: list.reversed())
    }
}
