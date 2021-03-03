//
//  AcessibilityViewController.swift
//  AcessibilityFaceMovimentBR
//
//  Created by Joao Batista on 13/02/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import UIKit

open class AcessibilityViewController: UIViewController {

  // MARK: Delegates

  public weak var delegateTabBar: TabBarSelectedProtocol?
  public weak var delegateNavigationBar: NavigationBackButtonProtocol?
  public weak var delegateCellView: CellViewSelectedProtocol?

  // MARK: - Public Property

  open var cursor = UIImageView(frame: CGRect(x: Cursor.x, y: Cursor.y, width: Cursor.width, height: Cursor.heigh))
  open var action: ActionProtocol!

  public override func viewDidLoad() {
    super.viewDidLoad()
    action = ActionInView(target: self)
    setupCursor()
    insertCursor()
  }

  // MARK: - Private Class Methods

  private func setupCursor() {
    cursor.image = Asset.cursorDefault.image
    cursor.accessibilityIdentifier = AccessibilityUIType.uiCursor.identifier
  }

  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tabBarController?.tabBar.invalidateIntrinsicContentSize()
  }

  private func insertCursor() {
    if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, (getCursor(inWindows: window) == nil) {
      window.addSubview(cursor)
      return
    }

    if let window = UIApplication.shared.windows.first, (getCursor(inWindows: window) == nil) {
      window.makeKey()
      window.addSubview(cursor)
      return
    }
  }

  private func getCursor(inWindows windows: UIWindow) -> UIImageView? {
    if let cursor = windows.getViewAcessibility(WithType: .uiCursor) as? UIImageView {
      self.cursor = cursor
      return self.cursor
    }
    return nil
  }
}

// MARK: - Selector for delegates

extension AcessibilityViewController {

  @objc private func selectedTabBar(withIndex index: String) {
    guard let selectedIndex = Int(index) else { return }
    delegateTabBar?.tabBar(isSelectedIndex: selectedIndex)
  }

  @objc private func selectedBackNavigationBar() {
    delegateNavigationBar?.actionNavigationBack()
  }

  @objc open func selectedCell(_ sender: Any? = nil) {
    guard let index = sender as? IndexPath else { return }
    delegateCellView?.cellSelected(withIndex: index)
  }
}

// MARK: - GetNavigation Controll Actions

extension AcessibilityViewController {

  open func getViewsActionWithTabBar() -> [ViewAction] {
    return self.createViewsActionInTabBar(withSelector: #selector(selectedTabBar(withIndex:)))
  }

  open func getViewsActionBackNavigationBar() -> [ViewAction] {
    return self.createViewsActionBackNavigationBar(withSelector: #selector(selectedBackNavigationBar))
  }

  open func getViewActionNavigationAndTabBar() -> [ViewAction] {
    var newViewActions = [ViewAction]()
    newViewActions.append(contentsOf: self.createViewsActionInTabBar(withSelector: #selector(selectedTabBar(withIndex:))))
    newViewActions.append(contentsOf: self.createViewsActionBackNavigationBar(withSelector: #selector(selectedBackNavigationBar)))
    return newViewActions
  }
}
