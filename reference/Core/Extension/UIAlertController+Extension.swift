//
//  UIAlertController+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UIAlertController {

    class func okAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        return alert
    }

    class func actionAlert(title: String, message: String? = nil, completion: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: { _ in
            completion()
        }))
        return alert
    }

}
