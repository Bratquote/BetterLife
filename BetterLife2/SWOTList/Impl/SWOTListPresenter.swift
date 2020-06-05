//
//  SWOTListPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class SWOTListPresenter {
    var view: SWOTListViewController
    
    init(view: SWOTListViewController) {
        self.view = view
    }
    
    func requestList() {
        let list = UserDefaultsWrapper.getSWOTList()
        
        view.updateList(list)
    }
}

