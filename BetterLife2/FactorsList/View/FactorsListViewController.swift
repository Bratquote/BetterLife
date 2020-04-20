//
//  FactorsListViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 17.02.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class FactorsListViewController: UIViewController {

    var presenter: FactorsListPresenter!
    
    @IBOutlet weak var positiveNegativeSC: UISegmentedControl!
    @IBOutlet weak var internalExternalSC: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    var list: [FactorItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestData()
    }
    
    
    
    func requestData() {
        let emotion = currentEmotionType()
        let position = currentPositionType()
        
        presenter.requestData(emotion: emotion, position: position)
        
    }
    
    func updateTableView(list: [FactorItem]) {
        self.list = list
        tableView.reloadData()
    }
    
    func currentEmotionType() -> EmotionType {
        switch positiveNegativeSC.selectedSegmentIndex {
        case 0:
            return .all
        case 1:
            return .positive
        case 2:
            return .negative
        default:
            return .all
        }
    }
    
    func currentPositionType() -> PositionType {
        switch internalExternalSC.selectedSegmentIndex {
        case 0:
            return .all
        case 1:
            return .internal
        case 2:
            return .external
        default:
            return .all
        }
    }
    
    func showAlertWithTF() {
        //Step : 1
        let alert = UIAlertController(title: "Новый фактор", message: "Введите фактор вашей жизни", preferredStyle: UIAlertController.Style.alert )
        //Step : 2
        let save = UIAlertAction(title: "Добавить", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            let factor = FactorItem(id: nil, name: textField.text!, emotion: self.currentEmotionType(), position: self.currentPositionType())
            self.presenter.updateFactor(factor, action: .create)
            self.presenter.requestData(emotion: self.currentEmotionType(), position: self.currentPositionType())
         //self.city(CityItem(id: UserDefaultsWrapper.lastCardIndex(of: .city),
            //                name: textField.text!,
             //               isSelected: false), action: .create)
         //self.updateTableView()
            
        }
        
        //Step : 3
        //For first TF
        alert.addTextField { (textField) in
            textField.placeholder = "\(self.currentEmotionType().rawValue) \(self.currentPositionType().rawValue.lowercased())"
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
    
    @IBAction func positiveNegativeSCChanged(_ sender: Any) {
        requestData()
    }
    @IBAction func internalExternalSCChanged(_ sender: Any) {
        requestData()
    }

    @IBAction func addFactorButtonTapped(_ sender: Any) {
        if currentEmotionType() != .all && currentPositionType() != .all {
            showAlertWithTF()
        }
    }
    
}


extension FactorsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = list[indexPath.row].name
        
        var detail = ""
        
        if currentEmotionType() == .all {
            if list[indexPath.row].emotion == .positive { detail = "+ "}
            else { detail = "- "}
        }
        
        if currentPositionType() == .all {
            if list[indexPath.row].position == .external { detail += "out "}
            else { detail += "in "}
        }
        
        
        cell.detailTextLabel?.text = detail//list[indexPath.row].emotion.rawValue + list[indexPath.row].position.rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //открыть детальную инфу
    }
    

    
    
}
