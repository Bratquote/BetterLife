//
//  FoundationExtension.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation


extension Date {
    init(year: Int? = nil, mounth: Int? = nil, day: Int? = nil) {
        var components = DateComponents()
        components.timeZone = TimeZone(secondsFromGMT: 0)
        components.day = day ?? 1
        components.year = year
        components.month = mounth ?? 1
        
        let date = Calendar.current.date(from: components)
        self = date!
    }
    
    init(noTime: Bool) {
        self.init()
        
        if noTime {
            let date = self.getDateString()
            let list = date.split(separator: ".")
            var components = DateComponents()
            components.year = Int(list[2])
            components.month = Int(list[1])
            components.day = Int(list[0])
            components.timeZone = TimeZone(secondsFromGMT: 0)
            let newDate = Calendar.current.date(from: components)!
            self = newDate
        }
        
    }
    
    func getMonthString() -> String {
        let calendar = Calendar.current
        let components = calendar.component(.month, from: self)
        
        return components.getMonthString()
    }
    
    func getDateString() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month,.year,.day], from: self)
        
        let result = "\(components.day!).\(components.month!).\(components.year!)"
        
        return result
    }
    
    func getMonth() -> Int {
        let calendar = Calendar.current
        let components = calendar.component(.month, from: self)
        
        return components
    }
    
    func getYear() -> Int {
        let calendar = Calendar.current
        let component = calendar.component(.year, from: self)
        
        return component
    }
    
    func getDay() -> Int {
        let calendar = Calendar.current
        let components = calendar.component(.day, from: self)
        
        return components
    }
    
    
}

extension Date {

  static func today() -> Date {
      return Date()
  }

  func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.next,
               weekday,
               considerToday: considerToday)
  }

  func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
    return get(.previous,
               weekday,
               considerToday: considerToday)
  }

  func get(_ direction: SearchDirection,
           _ weekDay: Weekday,
           considerToday consider: Bool = false) -> Date {

    let dayName = weekDay.rawValue

    let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }

    assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")

    let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1

    let calendar = Calendar(identifier: .gregorian)

    if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
      return self
    }

    var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
    nextDateComponent.weekday = searchWeekdayIndex

    let date = calendar.nextDate(after: self,
                                 matching: nextDateComponent,
                                 matchingPolicy: .nextTime,
                                 direction: direction.calendarSearchDirection)

    return date!
  }

}

// MARK: Helper methods
extension Date {
  func getWeekDaysInEnglish() -> [String] {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "en_US_POSIX")
    return calendar.weekdaySymbols
  }

  enum Weekday: String {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
  }

  enum SearchDirection {
    case next
    case previous

    var calendarSearchDirection: Calendar.SearchDirection {
      switch self {
      case .next:
        return .forward
      case .previous:
        return .backward
      }
    }
  }
}


extension Int {
    func getMonthString() -> String {
        switch self {
        case 1:
            return "Январь"
        case 2:
            return "Февраль"
        case 3:
            return "Март"
        case 4:
            return "Апрель"
        case 5:
            return "Май"
        case 6:
            return "Июнь"
        case 7:
            return "Июль"
        case 8:
            return "Август"
        case 9:
            return "Сентябрь"
        case 10:
            return "Октябрь"
        case 11:
            return "Ноябрь"
        case 12:
            return "Декабрь"
        default:
            return "Январь"
        }
    }
    
    func getWeekdayString() -> String {
        switch self {
        case 1:
            return "Понедельник"
        case 2:
            return "Вторник"
        case 3:
            return "Среда"
        case 4:
            return "Четверг"
        case 5:
            return "Пятница"
        case 6:
            return "Суббота"
        case 7:
            return "Воскресенье"
        default:
            return "Понедельник"
        }
    }
}
