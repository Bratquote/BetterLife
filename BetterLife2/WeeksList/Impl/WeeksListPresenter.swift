//
//  WeeksListPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 07.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class WeeksListPresenter {
    var view: WeeksListViewController
    var router: WeeksListRouter
    
    init(view: WeeksListViewController, router: WeeksListRouter) {
        self.view = view
        self.router = router
    }
    
    func openTargetList(item: DateItem) {
        router.openTargetList(item: item)
    }
    
}
