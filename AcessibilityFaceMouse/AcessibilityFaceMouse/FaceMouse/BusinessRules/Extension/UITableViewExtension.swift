//
//  UITableViewExtension.swift
//  AcessibilityFaceMovimentBR
//
//  Created by Joao Batista on 25/02/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import UIKit

public extension UITableView {

  func getCell() -> [UITableViewCell] {
    var cells = [UITableViewCell]()
    for section in 0...(self.numberOfSections-1) {
      for row in 0...(self.numberOfRows(inSection: section)-1) {
        if let cell = self.cellForRow(at: IndexPath(row: row, section: section)) {
          cells.append(cell)
          cell.accessibilityElements = [IndexPath(row: row, section: section)]
        }
      }
    }
    return cells
  }

  func nextCell(withScrollPosition scrollPosition: ScrollPosition = .none) {
    guard let actualIndexPath = self.indexPathsForVisibleRows?.last else {return}
    if let indexPath = getNewRowForVisible(basedIndexPath: actualIndexPath, isNextCell: true) {
      self.scrollToRow(at: indexPath, at: scrollPosition, animated: true)
    }
  }

  func backCell(withScrollPosition scrollPosition: ScrollPosition = .none) {
    guard let actualIndexPath = self.indexPathsForVisibleRows?.first else {return }
    if let indexPath = getNewRowForVisible(basedIndexPath: actualIndexPath, isNextCell: false) {
      self.scrollToRow(at: indexPath, at: scrollPosition, animated: true)
    }
  }

  private func getNewRowForVisible(basedIndexPath indexPath: IndexPath, isNextCell isNext: Bool) -> IndexPath? {
    let section = getSections(basedIndexPath: indexPath, isNext: isNext)
    return getIndexPath(basedIndexPath: indexPath, inSection: section, isNext: isNext)
  }

  private func getSections(basedIndexPath indexPath: IndexPath, isNext next: Bool) -> Int {
    if indexPath.section == (self.numberOfSections - 1)  || indexPath.section == 0 {
      return indexPath.section
    }
    return next ? verifySectionNext(withIndexPath: indexPath) : verifySectionBack(withIndexPath: indexPath)
  }

  func verifySectionNext(withIndexPath indexPath: IndexPath) -> Int {
    if indexPath.row == self.numberOfRows(inSection: indexPath.section) - 1 {
      return indexPath.section + 1
    }
    return indexPath.section
  }

  func verifySectionBack(withIndexPath indexPath: IndexPath) -> Int {
    if indexPath.row == 0  {
      return indexPath.section - 1
    }
    return indexPath.section
  }
  
  private func getIndexPath(basedIndexPath indexPath: IndexPath, inSection section: Int, isNext next: Bool) -> IndexPath {
    var newIndexPath = indexPath

    if next && indexPath.row == (self.numberOfRows(inSection: section) - 1) {
       newIndexPath = getRowNext(withIndexPath: indexPath)
    } else if indexPath.row == 0 && !next {
      newIndexPath = getRowBack(withIndexPath: indexPath)
    } else {
        newIndexPath.row = next ? newIndexPath.row + 1 : newIndexPath.row - 1
    }
    return newIndexPath
  }

  private func getRowNext(withIndexPath indexPath: IndexPath) -> IndexPath  {
    var newIndexPath = indexPath
    if (indexPath.section + 1) <= (self.numberOfSections - 1) {
      newIndexPath.section += 1
      newIndexPath.row = 0
    }
    return newIndexPath
  }

  private func getRowBack(withIndexPath indexPath: IndexPath) -> IndexPath  {
    var newIndexPath = indexPath
    if (indexPath.section - 1) >= 0 {
      newIndexPath.section -= 1
      newIndexPath.row = self.numberOfRows(inSection: newIndexPath.section) - 1
    }
    return newIndexPath
  }
}
