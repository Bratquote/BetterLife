//
//  MainScreenViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 19.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    var presenter: MainScreenPresenter!
    var todayList: [Any] = []

    @IBOutlet weak var instructionView: UIView!
    @IBOutlet weak var todayTableView: UITableView!
    @IBOutlet weak var todayTaskView: UIView!
    @IBOutlet weak var SWATVIew: UIView!
    @IBOutlet weak var today2View: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupViews()
        presenter.requestList()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        todayTableView.dataSource = self
        todayTableView.delegate = self
        todayTableView.register(UINib(nibName: "AddTargetCell", bundle: Bundle.main), forCellReuseIdentifier: "AddTargetCell")
        //
        todayTableView.layer.borderColor = today2View.backgroundColor?.cgColor
        todayTableView.layer.borderWidth = 1
        todayTableView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 10.0)
    }
    func updateTableView(list: [Any]) {
        todayList = list
        todayTableView.reloadData()
        
    }
    
    func setupViews() {
        SWATVIew.setRound()
        todayTaskView.setRound()
        instructionView.setRound()
        today2View.roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
        
        setupTableView()
        
    }
    func showAlertWithTF(date: Date, position: IndexPath) {
        //Step : 1
        let alert = UIAlertController(title: "Новая цель", message: "Введите задачу которую хотите выполнить", preferredStyle: UIAlertController.Style.alert )
        //Step : 2
        let save = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
          
            let target = TargetItem(id: nil, name: textField.text!, date: Date(noTime: true), type: .day, isCompleted: false)
          self.presenter.createTarget(item: target)
          self.todayList.insert(target, at: 0)
         // self.tableView.reloadRows(at: [position], with: .top)
            
          self.todayTableView.reloadData()
        // self.city(CityItem(id: UserDefaultsWrapper.lastCardIndex(of: .city),
           //                 name: textField.text!,
           //                 isSelected: false), action: .create)
         //self.updateTableView()
        
        }
        
        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "Цель"
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
    
    
    @IBAction func tasksTodayTapped(_ sender: Any) {
    }
    
    @IBAction func AnalysSWOTButtonTapped(_ sender: Any) {
        presenter.openCreateSWOT()
    }
    
}


extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = todayList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: getTableViewCellIdentifier(item: item))!
        
        switch item {
        case is TargetItem:
            cell.textLabel?.text = (item as! TargetItem).name
            if (item as! TargetItem).isCompleted {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            break
        case is Date:
            break
        default:
            break
        }
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch todayList[indexPath.row] {
        case is Date:
            showAlertWithTF(date: todayList[indexPath.row] as! Date, position: indexPath)
            break
        case is TargetItem:
            //presenter.targetCompleted(item: todayList[indexPath.row] as! TargetItem)
            var k = todayList[indexPath.row] as! TargetItem
            k.isCompleted.toggle()
            todayList[indexPath.row] = k
            tableView.reloadRows(at: [indexPath], with: .bottom)
            break
        default:
            break
        }
    }
    
    
    func getTableViewCellIdentifier(item: Any) -> String {
        switch item {
        case is DateItem:
            return "TargetHeader"
        case is TargetItem:
            return "TargetCell"
        case is Date:
            return "AddTargetCell"
        default:
           return "TargetHeader"
        }
    }
    
    
}
