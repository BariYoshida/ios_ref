//
//  UITableView+Extension.swift
//  reference
//
//  Created by 吉田寛規 on 2024/06/14.
//

import Foundation
import UIKit

extension UITableView {
    // 与えられたindexPathの下部のセルの数を返す
    func belowCellsCount(cellIndexPath: IndexPath) -> Int {
        // 全てのセルの数
        let allCellsCount = Array(0 ..< self.numberOfSections).reduce(0) { (sum, sectionIndex) -> Int in
            return sum + numberOfRows(inSection: sectionIndex)
        }
        // `cellIndexPath`の上部のセクションのすべてのセルの数
        let cellsInAboveSectionCount = Array(0 ..< cellIndexPath.section).reduce(0) { (sum, sectionIndex) -> Int in
            return sum + self.numberOfRows(inSection: sectionIndex)
        }
        return allCellsCount - cellsInAboveSectionCount - cellIndexPath.row
    }
}
