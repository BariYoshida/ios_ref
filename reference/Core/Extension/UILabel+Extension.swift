//
//  UILabel+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UILabel {
    /// 行数を返す
    func lineNumber() -> Int {
        let oneLineRect = "a".boundingRect(
            with: self.bounds.size,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font ?? UIFont()],
            context: nil
        )
        let boundingRect = (self.text ?? "").boundingRect(
            with: self.bounds.size,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self.font ?? UIFont()],
            context: nil
        )

        return Int(boundingRect.height / oneLineRect.height)
    }
}
