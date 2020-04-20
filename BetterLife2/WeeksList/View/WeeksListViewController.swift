//
//  WeeksListViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 07.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class WeeksListViewController: UIViewController {

    var presenter: WeeksListPresenter!
    var list: [DateItem] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        list = DateItemGenerator().generateWeeks()
        // Do any additional setup after loading the view.
    }
    
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.register(UINib(nibName: "WeeksListCell", bundle: Bundle.main), forCellReuseIdentifier: "WeeksListCell")
    }
}


extension WeeksListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeeksListCell") as! WeeksListCell
        let i = list[indexPath.row].date!
        cell.periodLabel.text = "с \(i.getDateString()) по \(i.next(.sunday).getDateString())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.openTargetList(item: list[indexPath.row])
    }
    
}
