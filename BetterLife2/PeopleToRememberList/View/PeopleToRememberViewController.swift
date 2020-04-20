//
//  PeopleToRememberViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 29.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class PeopleToRememberViewController: UIViewController {

    var presenter: PeopleToRememberPresenter!
    
    var list: [PersonItem] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        updateTableView()
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        view.layoutIfNeeded()
        // Do any additional setup after loading the view.
    }
    
    func openDetailedInfo(person: PersonItem) {
        
    }
    
    func updatePerson(_ person: PersonItem, action: ActionType) {
        presenter.updatePerson(person, action: action)
    }
    
    func updateTableView() {
        //request list
        presenter.requestList()
        
    }
    
    func updateList(list: [PersonItem]) {
        self.list = list
        tableView.reloadData()
    }
    
    func showAlertWithTF() {
        //Step : 1
        let alert = UIAlertController(title: "Новый человек", message: "Введите имя того, о ком стоит помнить всегда", preferredStyle: UIAlertController.Style.alert )
        //Step : 2
        let save = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            self.updatePerson(PersonItem(id: UserDefaultsWrapper.lastCardIndex(of: .person) ,name: textField.text!), action: .create)
            self.updateTableView()
            
        }
        
        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "Имя"
           // textField.text = self.cardInfo.note
            textField.textColor = .black
        }
        //Step : 4
        alert.addAction(save)
        //Cancel action
        let cancel = UIAlertAction(title: "Отменить", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        
        self.present(alert, animated:true, completion: nil)
        
    }
    @objc func addButtonTapped() {
        showAlertWithTF()
    }
    
    @IBAction func addPersonButtonTapped(_ sender: Any) {
        showAlertWithTF()
    }
    
}


extension PeopleToRememberViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel?.text = list[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailedInfo(person: list[indexPath.row])
    }
    
}
