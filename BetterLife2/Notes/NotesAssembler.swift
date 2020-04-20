//
//  NotesAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 10.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class NotesAssembler {
    func assemble(item: DateItem) -> NotesViewController {
        let storyboard = UIStoryboard(name: "Notes", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NotesViewController") as! NotesViewController
        
        let presenter = NotesPresenter(view: viewController)
        viewController.presenter = presenter
        viewController.item = item
        
        return viewController
    }
}
