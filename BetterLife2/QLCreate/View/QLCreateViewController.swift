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
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        if let item = oldItem {
            createButton.setTitle("Сохранить", for: .normal)
            deleteButton.isHidden = false
            nameTextField.text = item.name
            reasonTextField.text = item.comment
            importantSegmentedControl.selectedSegmentIndex = item.important-1
            satisfactionSegmentedControl.selectedSegmentIndex = item.satisfaction-1
            
            
        } else {
            deleteButton.isHidden = true
            createButton.setTitle("Создать", for: .normal)
        }
    }
    
    func updateItem(action: ActionType) {
        let newItem = QLItem(id: oldItem?.id,
                             name: nameTextField.text ?? "",
                                 satisfaction: satisfactionSegmentedControl.selectedSegmentIndex+1,
                                 important: importantSegmentedControl.selectedSegmentIndex+1,
                                 category: .none,
                                 comment: reasonTextField.text ?? "")
            presenter.updateItem(item: newItem, action: action)
    }
    
    @objc func deleteItem(action: UIAlertAction) {
        updateItem(action: .delete)
    }
    @IBAction func categoryViewTapped(_ sender: Any) {
        //show picker view
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if oldItem != nil {
            updateItem(action: .edit)
        } else {
            updateItem(action: .create)
        }
    self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
       let alert = UIAlertController(title: "Удаление критерия", message: "Вы действительно уверены?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: { action in
            self.updateItem(action: .delete)
            self.navigationController?.popToRootViewController(animated: true)
        }))
       alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

       self.present(alert, animated: true)
    }
}
