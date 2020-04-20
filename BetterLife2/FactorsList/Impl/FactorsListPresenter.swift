//
//  FactorsListPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class FactorsListPresenter {
    var view: FactorsListViewController
    var router: FactorsListRouter
    
    init(view: FactorsListViewController, router: FactorsListRouter) {
        self.view = view
        self.router = router
    }
    
    func updateFactor(_ factor: FactorItem, action: ActionType) {
        CoreDataWrapper.factor(factor, action: action)
    }
    func requestData(emotion: EmotionType, position: PositionType) {
        let list = CoreDataWrapper.getFactorsList()
        var newList: [FactorItem] = []
        
        for i in list {
            if emotion == .all && position == .all {
                newList.append(i)
            } else if emotion == .all {
                if i.position == position {
                    newList.append(i)
                }
            } else if position == .all {
                if i.emotion == emotion {
                    newList.append(i)
                }
            } else if position == i.position && emotion == i.emotion {
                newList.append(i)
            }
        }
//        for i in list {
//            switch emotion {
//            case .all:
//                break
//            default:
//                switch position {
//                case .all:
//                    newList.append(i)
//                default:
//                    if emotion == i.emotion && position == i.position {
//                        newList.append(i)
//                    }
//                }
//            }
//        }
        
        view.updateTableView(list: newList)
    }
}
