//
//  ViewControllerExtensionTest.swift
//  AcessibilityFaceMouseTests
//
//  Created by Joao Batista on 09/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//


import XCTest
import UIKit
@testable import AcessibilityFaceMouse

class ViewControllerExtensionTest: XCTestCase {
  
  var voiceAction: VoiceAction!
  var delegateVoiceSpy = MockVoiceActionSpy()
  
  override func setUpWithError() throws {
    voiceAction = VoiceAction()
    voiceAction.delegate = delegateVoiceSpy
    voiceAction.delegateResponseCommand = delegateVoiceSpy
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  // MARK: - Update Values Test
  
  func testVerifyDefaultLocation() throws {
    let defaultValue = voiceAction.speechReconizer?.locale.identifier
    XCTAssertEqual(defaultValue , "pt-BR")
  }
}
