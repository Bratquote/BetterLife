//
//  NotesPresenter.swift
//  BetterLife2
//
//  Created by Timur Karimov on 10.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

class NotesPresenter {
    var view: NotesViewController
    
    init(view: NotesViewController) {
        self.view = view
    }
    
    func getItemNotes(item: DateItem) {
        let text = CoreDataWrapper.getNoteValue(item: item)
        view.updateNote(text: text)
    }
    
    func updateValue(item: DateItem, text: String) {
        CoreDataWrapper.updateNote(item: item, text: text, action: .edit)
    }
}
