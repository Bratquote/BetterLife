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
    
    var list: [QLItem] = [QLItem(id: 12, name: "Test", satisfaction: 3, important: 4, category: .health, comment: "Kek")]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QLLifeCell
        cell.initCell(item: list[indexPath.row])
        
        return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoQLCell") as! NoQLCell
            cell.createQL = {
                self.presenter.openQLCreate()
            }
            cell.whatIsQL = {
                
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list.count == 0 {
            return tableView.frame.height
        }
        return UITableView.automaticDimension
    }
    
    
}
