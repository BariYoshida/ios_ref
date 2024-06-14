//
//  Date+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation

extension Date {

    func getDateString(format: String) -> String {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = format
        return df.string(from: self)
    }
}
