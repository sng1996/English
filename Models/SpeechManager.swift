//
//  SpeechManager.swift
//  English
//
//  Created by Сергей Гаврилко on 09/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import AVFoundation
import UIKit

class SpeechManager {
    
    func load() {
        let string = "hello"
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        _ = AVSpeechSynthesizer()
    }
    
    func play(_ text: String) {
        let string = text
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
}
