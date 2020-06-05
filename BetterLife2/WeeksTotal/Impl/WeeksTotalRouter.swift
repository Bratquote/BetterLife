//
//  WeeksTotalRouter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksTotalRouter {
    
    var view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func openWeekInfo(item: DateItem) {
        let vc = TargetsListAssembler().assembler(dateItem: item)
        view.show(vc, sender: nil)
    }
}
