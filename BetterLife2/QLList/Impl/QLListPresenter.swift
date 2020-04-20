//
//  QLLifePresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class QLListPresenter {
    var view: QLListViewController!
    var router: QLListRouter!
    
    init(view: QLListViewController, router: QLListRouter) {
        self.view = view
        self.router = router
    }
    
    
    func requestItems() {
        let items: [QLItem] = CoreDataWrapper.getQLList()
        view.updateTableView(list: items)
    }
    
    func openQLCreate(item: QLItem? = nil) {
        router.openQLCreate()
    }
}
