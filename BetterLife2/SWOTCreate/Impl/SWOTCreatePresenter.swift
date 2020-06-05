//
//  SWOTCreatePresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class SWOTCreatePresenter {
    
    var view: SWOTCreateViewController
    var router: SWOTCreateRouter
    
    init(view: SWOTCreateViewController, router: SWOTCreateRouter) {
        self.view = view
        self.router = router
    }
    
    func requestData() {
        var list: [Any] = []
        
        list.append(HeaderItem(text: "Ядро качества жизни"))
        
        let coreList: [String] = ["Тело", "Разум", "Эмоции", "Воля", "Дух"]
        var k = 0
        for i in coreList {
            list.append(SWOTCharacteristic(id: k, name: i, important: 3, happiness: 3))//QLItem(id: k, name: i, satisfaction: 3, important: 3, category: .none, comment: ""))
            k += 1
        }
        
        list.append(HeaderItem(text: "Пространства - сферы, составляющие качество жизни"))
        
        let spaceList: [String] = ["Интимное", "Семья", "Этнос", "Соседи", "Отдых", "Работа/финансы", "Общество", "Государство", "Цивилизация", "Непознанное (то, во что веришь)"]
        for i in spaceList {
           list.append(SWOTCharacteristic(id: k, name: i, important: 3, happiness: 3))//list.append(QLItem(id: k, name: i, satisfaction: 3, important: 3, category: .none, comment: ""))
           k += 1
        }
        
        list.append(TextFieldItem(emotion: .positive, placeHolder: "Положительный опыт (развивать и использовать)"))
        list.append(TextFieldItem(emotion: .negative, placeHolder: "Отрицательный опыт (исключать возможность повторения)"))
        list.append(TextFieldItem(emotion: .all, placeHolder: "Выводы"))
        
        list.append("Создать")
        
        
        view.updateTableView(list: list)
    }
    
    func createSWOT(item: SWOTItem) {
        UserDefaultsWrapper.saveSWOTItem(item)
    }
}
