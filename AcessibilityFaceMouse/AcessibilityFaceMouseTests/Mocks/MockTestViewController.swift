//
//  MockTestViewController.swift
//  AcessibilityFaceMouseTests
//
//  Created by Joao Batista on 06/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import UIKit
import AcessibilityFaceMouse

class MockTestViewController: AccessibilityFaceAnchorViewController {

  // MARK: - Proprety verification

  var selectorCalledView: Bool = false
  var selectorCalledbutton: Bool = false
  var selectorCalledUIImage: Bool = false

  var selectorDelegateTabbar: Bool = false

  var selectedIndex: Int = -1

  // MARK: - Proprety UIView
  let mockView = UIView(frame: CGRect(x: 0, y: 100, width: 200, height: 200))
  let mockButton = UIButton(frame: CGRect(x: 0, y: 300, width: 300, height: 200))
  let mockTabBar = UITabBar(frame: CGRect(x: 0, y: 500, width: 300, height: 300))
  let mockUiimageViews = UIImageView(frame: CGRect(x: 0, y: 800, width: 200, height: 200))
  let mockButtonTabBar = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
  let mockUITableView = UITableView(frame: CGRect(x: 0, y: 1000, width: 200, height: 200))
  var mockUICollectionView: UICollectionView!

  override func viewDidAppear(_ animated: Bool) {}

  override func viewDidLoad() {
    super.viewDidLoad()
    let layout = UICollectionViewFlowLayout()
    mockUICollectionView = UICollectionView(frame: CGRect(x: 0, y: 1200, width: 200, height: 200), collectionViewLayout: layout)
    insertViews()
  }

  func insertViews() {
    view.addSubview(mockTabBar)
    view.addSubview(mockView)
    view.addSubview(mockButton)
    view.addSubview(mockUiimageViews)
    mockTabBar.items = [mockButtonTabBar]
  }

  func getViews() -> [UIView] {
    return [mockView, mockButton]
  }

  func getViewsActions() -> [ViewAction] {
    let viewActions = [ViewAction(view: mockView, selector: #selector(mockViewSelector)),
    ViewAction(view: mockButton, selector: #selector(mockButtonSelector)),
    ViewAction(view: mockTabBar, selector: #selector(mockTabBarSelector(index:))),
    ViewAction(view: mockUiimageViews, selector: #selector(mockUIImageSelector)),
    ViewAction(view: mockUITableView, selector: #selector(mockTableSelector)),
    ViewAction(view: mockUICollectionView, selector: #selector(mockCollectionSelector))]
    return viewActions
  }

  @objc func mockViewSelector() {
    selectorCalledView = true
  }

  @objc func mockButtonSelector() {
    selectorCalledbutton = true
  }

  @objc func mockTabBarSelector(index: String) {
    guard let selectedIndex = Int(index) else { return }
    self.selectedIndex = selectedIndex
    selectorDelegateTabbar = true
  }
  
  @objc func mockUIImageSelector() {}
  @objc func mockTableSelector() {}
  @objc func mockCollectionSelector() {}
}


