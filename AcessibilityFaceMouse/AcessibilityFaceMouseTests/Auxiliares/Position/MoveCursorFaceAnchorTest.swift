//
//  MoveCursorFaceAnchorTest.swift
//  AcessibilityFaceMouseTests
//
//  Created by Joao Batista on 09/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import XCTest
import UIKit
@testable import AcessibilityFaceMouse

class MoveCursorFaceAnchorTest: XCTestCase {

  var moveCursorSut = MoveCursorFaceAnchor()

  let sensitivityDefault = FaceSensitivity(limitedTopX: 1.0, limitedBottonX: -1.0, limitedLeftY: 1.0, limitedRightY: -1.0)
  override func setUpWithError() throws {

  }

  // MARK: - FaceSensitivity test

  func testVerifyDefaultFaceSensitivity() throws {
    let sensitivity = FaceSensitivity.getDefault()
    XCTAssertEqual(moveCursorSut.faceSensitivity, sensitivity)
  }

  func testInsertInitFaceSensitivity() throws {
    let sensitivity = FaceSensitivity(limitedTopX: 1, limitedBottonX: 2, limitedLeftY: 1, limitedRightY: 2)
    moveCursorSut = MoveCursorFaceAnchor(faceSensitivity: sensitivity)
    XCTAssertEqual(moveCursorSut.faceSensitivity, sensitivity)
  }

  func testUpdateFaceSensitivity() throws {
    let sensitivity = FaceSensitivity(limitedTopX: 1, limitedBottonX: 2, limitedLeftY: 1, limitedRightY: 2)
    moveCursorSut.set(faceSensitivity: sensitivity)
    XCTAssertEqual(moveCursorSut.faceSensitivity, sensitivity)
  }

  // MARK: - NextPosition

  func testGetNextPositionTop() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 0.0, y: 1.0))
    XCTAssertEqual(newValue, CGPoint(x: 207, y: 672.0))
  }

  func testGetNextPositionBotton() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 0.0, y: -1.0))
    XCTAssertEqual(newValue, CGPoint(x: 207, y: 224.0))
  }

  func testGetNextPositionLeft() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: -1.0, y: 0.0))
    XCTAssertEqual(newValue, CGPoint(x: 103.5, y: 448.0))
  }

  func testGetNextPositionRight() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 1.0, y: 0.0))
    XCTAssertEqual(newValue, CGPoint(x: 310.5, y: 448.0))
  }

  // MARK: - Over value limited max and min

  func testOverMaxValueX() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 6.0, y: 0.0))
    XCTAssertEqual(newValue, CGPoint(x: UIScreen.main.bounds.width, y: 448.0))
  }

  func testOverMaxValueY() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 0.0, y: 6.0))
    XCTAssertEqual(newValue, CGPoint(x: 207, y: UIScreen.main.bounds.height))
  }
  func testOverMinValueX() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: -6.0, y: 0.0))
    XCTAssertEqual(newValue, CGPoint(x:0, y: 448.0))
  }

  func testOverMinValueY() throws {
    moveCursorSut.set(faceSensitivity: sensitivityDefault)
    let newValue = moveCursorSut.getNextPosition(withPoint: CGPoint(x: 0.0, y: -6.0))
    XCTAssertEqual(newValue, CGPoint(x: 207, y: 0))
  }


}
