//
//  VoiceActionActiveProtocol.swift
//  AcessibilityFaceMouse
//
//  Created by Joao Batista on 06/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//


public protocol VoiceActionActiveProtocol: AnyObject {
  func commandDetected(withCommand command: VoiceCommand)
}
