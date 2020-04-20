//
//  PeopleToRememberPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class PeopleToRememberPresenter {
    
    var view: PeopleToRememberViewController
    var interactor: PeopleToRememberInteractor
    var router: PeopleToRememberRouter
    
    init(view: PeopleToRememberViewController, interactor: PeopleToRememberInteractor, router: PeopleToRememberRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func requestList() {
        let list = CoreDataWrapper.getPersonsList()
        view.updateList(list: list)
    }
    
    func updatePerson(_ person: PersonItem, action: ActionType){
        CoreDataWrapper.person(person, action: action)
    }
}
