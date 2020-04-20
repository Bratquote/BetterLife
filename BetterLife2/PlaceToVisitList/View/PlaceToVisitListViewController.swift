//
//  PlaceToVisitListViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class PlaceToVisitListViewController: UIViewController {

    var presenter: PlaceToVisitListPresenter!
    
    var cityList: [CityItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        updateTableView()
        print(cityList)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
     //   navigationController?.navigationBar.
//        self.navigationController?.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil), animated: false)//.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        // Do any additional setup after loading the view.
    }
    
    func updateTableView() {
        presenter.requestList()
    }
    
    func updateList(_ list: [CityItem]) {
        cityList = list
        tableView.reloadData()
    }
    
    func city(_ city: CityItem, action: ActionType) {
        presenter.updateCity(city, action: action)
    }
    
    
    func showAlertWithTF() {
           //Step : 1
           let alert = UIAlertController(title: "Новая цель", message: "Введите место которое хотите посетить", preferredStyle: UIAlertController.Style.alert )
           //Step : 2
           let save = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
               let textField = alert.textFields![0] as UITextField
            self.city(CityItem(id: UserDefaultsWrapper.lastCardIndex(of: .city),
                               name: textField.text!,
                               isSelected: false), action: .create)
            self.updateTableView()
               
           }
           
           //Step : 3
           //For first TF
           alert.addTextField { (textField) in
               textField.placeholder = "Город"
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

}

extension PlaceToVisitListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = cityList[indexPath.row].name
        
        if cityList[indexPath.row].isSelected {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityList[indexPath.row].isSelected.toggle()
        city(cityList[indexPath.row], action: .edit)
        tableView.reloadData()
    }
    
    
    
}

