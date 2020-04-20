//
//  QLCreatePresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class QLCreatePresenter {
    var view: QLCreateViewController
    var router: QLCreateRouter
    
    init(view: QLCreateViewController, router: QLCreateRouter) {
        self.view = view
        self.router = router
    }
    
    func updateItem(item: QLItem, action: ActionType) {
        CoreDataWrapper.updateQLItem(item, action: action)
    }
}
