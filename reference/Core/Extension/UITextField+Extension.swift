//
//  UITextField+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UITextField {
    
    func addLeftMargin(_ width: Int = 10) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}
