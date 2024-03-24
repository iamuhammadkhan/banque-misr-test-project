//
//  UIScrollView+Extension.swift
//  banque-misr-test-project
//
//  Created by Muhammad Khan on 21/3/24.
//

import UIKit

extension UIScrollView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        next?.touchesBegan(touches, with: event)
    }
}
