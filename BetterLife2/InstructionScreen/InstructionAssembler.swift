//
//  InstructionAssembler.swift
//  BetterLife2
//
//  Created by Timur Karimov on 27.05.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


class InstructionAssembler {
    func assemble() -> InstructionViewController {
        
        let storyboard = UIStoryboard(name: "InstructionScreen", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "InstructionViewController") as! InstructionViewController
        
        return vc
    }
}
