//
//  UIView+Extension.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit

extension UIView {
    func roundedCorners() {
        layer.cornerRadius = frame.height / 2
    }
    
    func applyCornerRadius(of value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func applyShadow() {
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.4
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
