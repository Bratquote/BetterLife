//
//  TargetsListViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 31.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class TargetsListViewController: UIViewController {

    
    var presenter: TargetsListPresenter!
    
    var list: [Any] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeIntervalLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var uiMapper = TargetListUIMapper()
    var dateItem: DateItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        setupLabels()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.requestList(item: dateItem)
        view.layoutIfNeeded()
    }
    
    
    func updateTableView(list: [Any]) {
        self.list = list
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AddTargetCell", bundle: Bundle.main), forCellReuseIdentifier: "AddTargetCell")
        tableView.register(UINib(nibName: "MarkThisWeek", bundle: Bundle.main), forCellReuseIdentifier: "MarkThisWeek")
    }
    
    func setupLabels() {
        switch dateItem.type {
        case .years:
            break
        case .year:
            timeIntervalLabel.text = dateItem.value + " год"
            commentLabel.text = "20/80 Самые важные цели, задачи и события месяца в этом году"
            break
        case .month:
            timeIntervalLabel.text = "Цели за " + dateItem.value
            commentLabel.text = "20/80 Самые важные цели, задачи и события месяца в \(dateItem.parent?.value ?? "") году"
            break
        case .week:
            timeIntervalLabel.text = "Цели за неделю"
            commentLabel.text = ""
            break
        case .day:
            timeIntervalLabel.text = "Цели на \(dateItem.value) (\(dateItem.date?.getDateString() ?? ""))"
            commentLabel.text = "Напишите сюда цели за день"
            break
        }
    }
    
    
    func showAlertWithTF(date: Date, position: IndexPath) {
              //Step : 1
              let alert = UIAlertController(title: "Новая цель", message: "Введите задачу которую хотите выполнить", preferredStyle: UIAlertController.Style.alert )
              //Step : 2
              let save = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
                  let textField = alert.textFields![0] as UITextField
                
                var type = self.dateItem.type
                
                if let t = self.list.first as? DateItem {
                    type = t.type
                }
                let target = TargetItem(id: nil, name: textField.text!, date: date, type: type, isCompleted: false)
                self.presenter.createTarget(item: target)
                self.list.insert(target, at: position.row)
               // self.tableView.reloadRows(at: [position], with: .top)
                self.tableView.reloadData()
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

    @IBAction func notesButtonTapped(_ sender: Any) {
        presenter.openNotes(item: dateItem)
    }
}


extension TargetsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: uiMapper.getTableViewCellIdentifier(item: item))!
        
        switch item {
        case is DateItem:
            cell.textLabel?.text = (item as! DateItem).value// + " \((item as! DateItem).date)"
            cell.backgroundColor = Defaults.mainColor
            cell.textLabel?.textColor = UIColor.white
        case is TargetItem:
            cell.textLabel?.text = (item as! TargetItem).name// + (item as! TargetItem).date.getDateString()
            if (item as! TargetItem).isCompleted {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        case is String:
            (cell as! MarkThisWeekCell).initCell(value: item as! String)
            (cell as! MarkThisWeekCell).updateValue = {
                let i = (cell as! MarkThisWeekCell).iValue
                let h = (cell as! MarkThisWeekCell).hValue
                self.presenter.updateWeekMark(item: self.dateItem, important: i+1, happiness: h+1)
            }
        default:
            break
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch list[indexPath.row] {
        case is Date:
            var type = dateItem.type
            if let i = list[indexPath.row] as? DateItem {
                type = i.type
            }
            showAlertWithTF(date: list[indexPath.row] as! Date, position: indexPath)
            break
        case is DateItem:
            presenter.openTargetList(item: list[indexPath.row] as! DateItem)
            break
        case is TargetItem:
            presenter.targetCompleted(item: list[indexPath.row] as! TargetItem)
            var k = list[indexPath.row] as! TargetItem
            k.isCompleted.toggle()
            list[indexPath.row] = k
            tableView.reloadRows(at: [indexPath], with: .bottom)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if list[indexPath.row] is TargetItem {
              return true
              } else {
                  return false
              }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
              if (editingStyle == .delete) {
                presenter.deleteTarget(item: list[indexPath.row] as! TargetItem)
                  list.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .right)
                  //tableView.reloadData()
                  // handle delete (by removing the data from your array and updating the tableview)
              }
          }
    
}
