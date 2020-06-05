//
//  SWOTItem.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

let charsNames: [String] = ["Тело", "Разум", "Эмоции", "Воля", "Дух", "Интимное", "Семья", "Этнос", "Соседи", "Отдых", "Работа/финансы", "Общество", "Государство", "Цивилизация", "Непознанное (то, во что веришь)"]

struct SWOTItem: Codable{
    var id: Int
    var date: Date
    var charsList: [SWOTCharacteristic]
    var positiveText: String
    var negativeText: String
    var conclusionText: String
    
    init() {
        self.id = 1
        self.date = Date(noTime: true)
        self.charsList = []
        for i in 0..<charsNames.count {
            charsList.append(SWOTCharacteristic(id: i, name: charsNames[i], important: 3, happiness: 3))
        }
        self.positiveText = ""
        self.negativeText = ""
        self.conclusionText = ""
    }
}

