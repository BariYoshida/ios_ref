//
//  UIColor+AppColor.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/13.
//

import Foundation
import UIKit

extension UIColor {

    static var backgroundColor: UIColor {
        return UIColor.hexStr("1A1B28", 1)
    }
    
    // カラーコード文字列をUIColorとして返す
    static func hexStr(_ hexStr: String, _ alpha: CGFloat) -> UIColor {

        let scanner = Scanner(string: hexStr as String)
        var color: UInt64 = 0
        if scanner.scanHexInt64(&color) {
            let rr = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let gg = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let bb = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: rr, green: gg, blue: bb, alpha: alpha)
        } else {
            return .white
        }
    }

    static func rgb(r rr: Int, g gg: Int, b bb: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(rr) / 255.0, green: CGFloat(gg) / 255.0, blue: CGFloat(bb) / 255.0, alpha: alpha)
    }

    static func safetyInit(named: String, secoundary: UIColor) -> UIColor {
        return UIColor(named: named) ?? secoundary
    }
}
