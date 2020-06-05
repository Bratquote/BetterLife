//
//  InstructionLastViewController.swift
//  BetterLife2
//
//  Created by Timur Karimov on 27.05.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit

class InstructionLastViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func lastButtonTapped(_ sender: Any) {
        let vc = MainScreenAssembler().assemble()
        show(vc, sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
