//
//  PlaceToVisitListPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class PlaceToVisitListPresenter {
    var view: PlaceToVisitListViewController
    var router: PlaceToVisitListRouter
    
    init(view: PlaceToVisitListViewController, router: PlaceToVisitListRouter) {
        self.view = view
        self.router = router
    }
    
    func requestList() {
        let list = CoreDataWrapper.getCityList()
        view.updateList(list)
    }
    
    func updateCity(_ city: CityItem, action: ActionType) {
        CoreDataWrapper.city(city, action: action)
    }
}
