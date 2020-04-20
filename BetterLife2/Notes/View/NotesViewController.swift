//
//  NotesViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 10.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    var presenter: NotesPresenter!
    var item: DateItem!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getItemNotes(item: item)
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.updateValue(item: item, text: textView.text)
    }
    
    func updateNote(text: String) {
        textView.text = text
    }
    


}
