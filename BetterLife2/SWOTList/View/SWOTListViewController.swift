//
//  SWOTListViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTListViewController: UIViewController {

    var presenter: SWOTListPresenter!
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [SWOTItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.requestList()
    }
    
    func updateList(_ list: [SWOTItem]) {
        self.list = list
        tableView.reloadData()
    }

}


extension SWOTListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SWOTListCell") as! SWOTListCell
        cell.initCell(item: list[indexPath.row])
        
        return cell
    }
    
    
}
