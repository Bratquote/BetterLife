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
        var k = 1
        for i in coreList {
            list.append(QLItem(id: k, name: i, satisfaction: 3, important: 3, category: .none, comment: ""))
            k += 1
        }
        
        list.append(HeaderItem(text: "Пространства - сферы, составляющие качество жизни"))
        
        let spaceList: [String] = ["Интимное", "Семья", "Этнос", "Соседи", "Отдых", "Работа/финансы", "Общество", "Государство", "Цивилизация", "Непознанное (то, во что веришь)"]
        k = 1
        for i in spaceList {
           list.append(QLItem(id: k, name: i, satisfaction: 3, important: 3, category: .none, comment: ""))
           k += 1
        }
        
        list.append(TextFieldItem(placeHolder: "Положительный опыт (развивать и использовать)"))
        list.append(TextFieldItem(placeHolder: "Отрицательный опыт (исключать возможность повторения)"))
        list.append(TextFieldItem(placeHolder: "Выводы"))
        
        list.append("Создать")
        
        
        view.updateTableView(list: list)
    }
}
