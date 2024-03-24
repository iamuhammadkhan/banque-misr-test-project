//
//  UIViewController+Extension.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    static var identifier: String {
        String(describing: self)
    }
}
