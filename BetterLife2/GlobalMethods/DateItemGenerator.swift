//
//  DateItemGenerator.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class DateItemGenerator {
    
    
    func generateKids(item: DateItem) -> [DateItem] {
        var list: [DateItem] = []
        
        switch item.type {
        case .years:
            list.append(DateItem(type: .year, value: "2020", parent: nil, date: Date(year: 2020)))
            list.append(DateItem(type: .year, value: "2021", parent: nil, date: Date(year: 2021)))
            list.append(DateItem(type: .year, value: "2022", parent: nil, date: Date(year: 2022)))
            list.append(DateItem(type: .year, value: "2023", parent: nil, date: Date(year: 2023)))
            list.append(DateItem(type: .year, value: "2024", parent: nil, date: Date(year: 2024)))
            break
        case .year:
            let pDate = item.date!
            for i in 1...12 {
                list.append(DateItem(type: .month, value: i.getMonthString(), parent: item, date: Date(year: pDate.getYear(), mounth: i)))
            }
            break
        case .month:
            break
        case .week:
           // for i in 1...7 {
             //   list.append(DateItem(type: .day, value: i.getWeekdayString(), parent: nil, date: Date(year: item.date?.getYear(), mounth: item.date?.getMonth(), day: i)))
            let itemk = item.date!.next(.monday, considerToday: true)
            print(itemk)
            list.append(DateItem(type: .day, value: 1.getWeekdayString(), parent: nil, date: item.date!.next(.monday, considerToday: true)))
            list.append(DateItem(type: .day, value: 2.getWeekdayString(), parent: nil, date: item.date!.next(.tuesday, considerToday: true)))
            list.append(DateItem(type: .day, value: 3.getWeekdayString(), parent: nil, date: item.date!.next(.wednesday, considerToday: true)))
            list.append(DateItem(type: .day, value: 4.getWeekdayString(), parent: nil, date: item.date!.next(.thursday, considerToday: true)))
            list.append(DateItem(type: .day, value: 5.getWeekdayString(), parent: nil, date: item.date!.next(.friday, considerToday: true)))
            list.append(DateItem(type: .day, value: 6.getWeekdayString(), parent: nil, date: item.date!.next(.saturday, considerToday: true)))
            list.append(DateItem(type: .day, value: 7.getWeekdayString(), parent: nil, date: item.date!.next(.sunday, considerToday: true)))
           // }
            
            break
        case .day:
            break
        }
        return list
    }
    
    
    func generateWeeks() -> [DateItem] {
        var firstWeekDate = UserDefaultsWrapper.getFirstMonday()
        let lastWeekDate = Date.today().next(.monday, considerToday: false)
        
        print(firstWeekDate)
        print(lastWeekDate)
        
        var list: [DateItem] = []
        
        while firstWeekDate.getDateString() != lastWeekDate.getDateString() {
            list.append(DateItem(type: .week, value: "Неделя \(firstWeekDate.getDateString())", parent: nil, date: firstWeekDate))
            firstWeekDate = firstWeekDate.next(.monday)
            print(firstWeekDate)
        }
        list.append(DateItem(type: .week, value: "Неделя \(firstWeekDate.getDateString())", parent: nil, date: lastWeekDate))
        return list.reversed()
    }
}
