//
//  String+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation

extension String {
    func contain(pattern: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options()) else {
            return false
        }
        return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.count)) != nil
    }
    
    func abbreviated(limit: Int) -> String {
        if self.count > limit {
            return String(self.prefix(limit)) + "..."
        } else {
            return self
        }
    }
}
