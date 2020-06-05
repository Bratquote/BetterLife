//
//  SWOTCharacteristic.swift
//  BetterLife2
//
//  Created by Timur Karimov on 30.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import Foundation

struct SWOTCharacteristic: Codable {
    var id: Int
    var name: String
    var important: Int
    var happiness: Int
}
