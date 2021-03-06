//
//  ActionInViewTests.swift
//  AcessibilityFaceMouseTests
//
//  Created by Joao Batista on 03/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import XCTest
import UIKit
@testable import AcessibilityFaceMouse

class ActionInViewTests: XCTestCase {

  var actionView: ActionInView!

  override func setUpWithError() throws {
    actionView = ActionInView(target: MockTestViewController())
  }

  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testGetTypeActionDefault() throws {
    let actualType = actionView.getType()
    XCTAssertEqual(TypeStartAction.voice, actualType)
  }

  func testUpdateTypeActionDefault() throws {
    actionView.setTypeStartAction(withType: .eyeLeft)
    XCTAssertEqual(TypeStartAction.eyeLeft, actionView.getType())
  }

}
