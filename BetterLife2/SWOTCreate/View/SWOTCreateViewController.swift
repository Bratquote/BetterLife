//
//  SWOTCreateViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 14.03.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTCreateViewController: UIViewController {

    var presenter: SWOTCreatePresenter!
    var uiMapper: SWOTUIMapper!
    var list: [Any] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        presenter.requestData()
        
    }
    
    func setupTableView() {
        uiMapper = SWOTUIMapper()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func updateTableView(list: [Any]) {
        self.list = list
        tableView.reloadData()
    }
    
    func createButtonTapped() {
        
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
    }
    
}

extension SWOTCreateViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: uiMapper.getTableViewCellIdentifier(item: list[indexPath.row]))!
        (cell as! ComponentCell).initCell(item: list[indexPath.row])
        
        (cell as? SWOTCreateButtonCell)?.action = {
            self.createButtonTapped()
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
}
