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
    
    var item: SWOTItem!
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        item = SWOTItem()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        view.layoutIfNeeded()
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
        let p = tableView.cellForRow(at: IndexPath(row: list.count - 4, section: 0))
        if (p as! SWOTTextFieldCell).emotion == EmotionType.positive {
            item.positiveText = (p as! SWOTTextFieldCell).textField.text ?? ""
        }
        let n = tableView.cellForRow(at: IndexPath(row: list.count - 3, section: 0))
        if (n as! SWOTTextFieldCell).emotion == EmotionType.negative {
            item.negativeText = (n as! SWOTTextFieldCell).textField.text ?? ""
        }
        let a = tableView.cellForRow(at: IndexPath(row: list.count - 2, section: 0))
        if (a as! SWOTTextFieldCell).emotion == EmotionType.all {
            item.conclusionText = (a as! SWOTTextFieldCell).textField.text ?? ""
        }
        showAlert(value: "SWOT-анализ создан", title: "Успешно")
        presenter.createSWOT(item: item)
    }
    func showAlert(value: String, title: String) {
        let alert = UIAlertController(title: title, message: value, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        self.showAlert(value: "В данном анализе вы указываете важность и удовлетворенность для каждой характеристики от 1 до 5, после чего дополнительно пишете Положительный опыт (развивать и использовать), Положительный опыт (развивать и использовать) и Выводы", title: "Описание")
        
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
        
        (cell as? SWOTStepperCell)?.updated = {
            let obj = (cell as? SWOTStepperCell)?.object
            self.item.charsList[obj!.id] = obj!
            print(self.item)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
}
