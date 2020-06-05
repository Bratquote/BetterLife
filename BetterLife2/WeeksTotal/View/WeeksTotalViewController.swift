//
//  WeeksTotalViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 23.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksTotalViewController: UIViewController {
    
    var presenter: WeeksTotalPresenter!
    var list: [WeekItem] = []
    var dateList: [DateItem] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.requestList()
    }
    
    func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "QLLifeCell", bundle: Bundle.main), forCellReuseIdentifier: "QLLifeCell")
    }
    
    func updateList(_ list: [WeekItem], dateList: [DateItem]) {
        self.list = list
        self.dateList = dateList
        tableView.reloadData()
    }

}


extension WeeksTotalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QLLifeCell") as! QLLifeCell
        cell.initCell(item: list[indexPath.row])
        cell.categoryLabel.text = ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.openWeekInfo(item: dateList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
