//
//  VoiceAction.swift
//  AcessibilityFaceMovimentBR
//
//  Created by Joao Batista on 02/03/21.
//  Copyright © 2021 Joao Batista. All rights reserved.
//

import Speech

open class VoiceAction {

  private let audioEngine = AVAudioEngine()
  private var speechReconizer: SFSpeechRecognizer?
  private let request = SFSpeechAudioBufferRecognitionRequest()
  private var task: SFSpeechRecognitionTask!
  private var actionWords: [String] = []
  private var timer = TimerControl()
  private var isCooldown = false

  open weak var delegateActionVoice: VoiceActionActiveProtocol?
  open weak var delegate: VoiceActionResponseProtocol?

  init(locale: Locale = ValuesConstants.locale) {
    speechReconizer = SFSpeechRecognizer(locale: locale)
    timer.delegate = self
  }

  open func set(TheActionWords actionWords: [String]) {
    self.actionWords = actionWords
  }

  open func start() {
    startRecording()
  }

  open func checkPermissions() {
    SFSpeechRecognizer.requestAuthorization { authStatus in
      DispatchQueue.main.async {
        switch authStatus {
        case .authorized:
          self.delegate?.permissionGranted()
        case .denied:
          self.delegate?.errorPermission(status: .denied)
        case .restricted:
          self.delegate?.errorPermission(status: .restricted)
        case .notDetermined:
          self.delegate?.errorPermission(status: .notDetermined)
        @unknown default:
          self.delegate?.errorGeneric()
        }
      }
    }
  }

  private func startRecording() {
    let node = audioEngine.inputNode
    let recordingFormat = node.outputFormat(forBus: 0)

    node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
      self.request.append(buffer)
    }

    audioEngine.prepare()
    do {
      try audioEngine.start()
    } catch {
      delegate?.errorGeneric()
    }
    recognitionTask()
  }

  private func recognitionTask() {
    task = speechReconizer?.recognitionTask(with: request, resultHandler: { (response, error) in
      guard let response = response else { return }

      if error != nil {
        self.delegate?.errorGeneric()
        return
      }

      let message = response.bestTranscription.formattedString.split(separator: " ")
      if let actioText = message.last {
        print(String(actioText).lowercased())
        self.detectAction(WithActionText: String(actioText).lowercased())
      }
    })
  }

  private func detectAction(WithActionText actionText: String) {
    for action in actionWords where action.lowercased() == actionText  && !isCooldown {
      self.timer.startTimer(withTimerSeconds: ValuesConstants.cooldown)
      delegateActionVoice?.commandDetected(withCommand: action)
      isCooldown = true
    }
  }
}

extension VoiceAction: TimerActionResponseProtocol {
  func finishTimer() {
    isCooldown = false
  }
}
