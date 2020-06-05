//
//  SWOTListCell.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class SWOTListCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var positiveLabel: UILabel!
    @IBOutlet weak var negativeLabel: UILabel!
    @IBOutlet weak var allLabel: UILabel!
    
    var list: [SWOTCharacteristic] = []
    
    
    func initCell(item: SWOTItem) {
        list = item.charsList
        dateLabel.text = item.date.getDateString()
        positiveLabel.text = item.positiveText
        negativeLabel.text = item.negativeText
        allLabel.text = item.conclusionText
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SWOTListCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SWOTCharacteristicCell", for: indexPath) as! SWOTCharacteristicCell
        cell.initCell(item: list[indexPath.row])
        
        return cell
    }
    
    
}
