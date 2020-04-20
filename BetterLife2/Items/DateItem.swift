//
//  DateItem.swift
//  BetterLife2
//
//  Created by Timur Karimov on 01.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

public class DateItem {
    var type: DateType
    var value: String
    var parent: DateItem?
    var date: Date?
    
    init(type: DateType, value: String, parent: DateItem? = nil, date: Date? = nil) {
        self.type = type
        self.value = value
        self.parent = parent
        self.date = date
    }
}
