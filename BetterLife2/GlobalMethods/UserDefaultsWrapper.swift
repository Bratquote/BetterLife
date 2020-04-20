//
//  UserDefaultsWrapper.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation


class UserDefaultsWrapper {
    
    static func setLastIndex(of type: ItemsType) {
        var lastIndex = lastCardIndex(of: type)
        lastIndex += 1
        switch type {
        case .city:
            UserDefaults.standard.set(lastIndex, forKey: "lastCityIndex")
        case .person:
            UserDefaults.standard.set(lastIndex, forKey: "lastPersonIndex")
        case .QLItem:
            UserDefaults.standard.set(lastIndex, forKey: "lastQLItemIndex")
        case .target:
            UserDefaults.standard.set(lastIndex, forKey: "lastTargetIndex")
        case .factor:
            UserDefaults.standard.set(lastIndex, forKey: "lastFactorIndex")
        }
        
    }
    
    static func lastCardIndex(of type: ItemsType) -> Int {
        var key = ""
        switch type {
        case .city:
            key = "lastCityIndex"
        case .person:
            key = "lastPersonIndex"
        case .QLItem:
            key = "lastQLItemIndex"
        case .target:
            key = "lastTargetIndex"
        case .factor:
            key = "lastFactorIndex"
        }
        if let index = UserDefaults.standard.value(forKey: key) as? Int {
            UserDefaults.standard.set(index + 1, forKey: key)
            return index
        } else {
            UserDefaults.standard.set(1, forKey: key)
            return 0
        }
        
    }
    
    
    static func getFirstMonday() -> Date {
        if let date = UserDefaults.standard.value(forKey: "firstMonday") as? Date {
        return date
        } else {
            self.setFirstMonday()
            return UserDefaults.standard.value(forKey: "firstMonday") as! Date 
        }
    }
    
    static func setFirstMonday() {
        let date = Date.today().previous(.monday, considerToday: true)
        UserDefaults.standard.set(date, forKey: "firstMonday")
    }
    
}
