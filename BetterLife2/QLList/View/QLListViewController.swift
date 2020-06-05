//
//  QLLifeViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 12.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class QLListViewController: UIViewController {

    var presenter: QLListPresenter!
    
    var list: [QLItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.requestItems()
    }
    func updateTableView(list: [QLItem]) {
        self.list = list
        tableView.reloadData()
    }
    func showAlert(value: String, title: String) {
        let alert = UIAlertController(title: title, message: value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupView() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        view.layoutIfNeeded()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "QLLifeCell", bundle: Bundle.main), forCellReuseIdentifier: "QLLifeCell")
    }
    
    @objc func addTapped() {
        presenter.openQLCreate()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        presenter.openQLCreate()
    }
}

extension QLListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if list.count != 0 {
       return list.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if list.count != 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QLLifeCell") as! QLLifeCell
        cell.initCell(item: list[indexPath.row])
        
        return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoQLCell") as! NoQLCell
            cell.createQL = {
                self.presenter.openQLCreate()
            }
            cell.whatIsQL = {
                self.showAlert(value: "Добавьте сюда составляющие качества вашей жизни, указав насколько они для вас важны, и на сколько вы ими удовлетворены", title: "Описание")
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if list.count > 0 {
        presenter.openQLCreate(item: list[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list.count == 0 {
            return tableView.frame.height
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if tableView.cellForRow(at: indexPath) is QLLifeCell {
        return true
        } else {
            return false
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            presenter.deleteQL(item: list[indexPath.row])
            list.remove(at: indexPath.row)
            if list.count == 0 {
            tableView.reloadData()
            } else {
                tableView.deleteRows(at: [indexPath], with: .right)
            }
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    
}
