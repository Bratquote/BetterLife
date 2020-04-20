//
//  QLCreateViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLCreateViewController: UIViewController {

    var presenter: QLCreatePresenter!
    var oldItem: QLItem?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var importantSegmentedControl: UISegmentedControl!
    @IBOutlet weak var satisfactionSegmentedControl: UISegmentedControl!
    @IBOutlet weak var categoryTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addItem() {
        let newItem = QLItem(name: nameTextField.text ?? "",
                                 satisfaction: satisfactionSegmentedControl.selectedSegmentIndex+1,
                                 important: importantSegmentedControl.selectedSegmentIndex+1,
                                 category: .none,
                                 comment: "")
        presenter.updateItem(item: newItem, action: .create)
    }
    
    @IBAction func categoryViewTapped(_ sender: Any) {
        //show picker view
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addItem()
    self.navigationController?.popToRootViewController(animated: true)
    }
}
