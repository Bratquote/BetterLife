//
//  UIKitExtension.swift
//  BetterLife2
//
//  Created by Timur Karimov on 18.04.2020.
//  Copyright © 2020 Timur Karimov. All rights reserved.
//

import UIKit


extension UIView {
    
    func setRound() {
        self.layer.cornerRadius = 10
    }
    
    func setDefaulColor() {
        self.backgroundColor = UIColor.green
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
