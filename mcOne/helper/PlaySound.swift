//
//  PlaySound.swift
//  mcOne
//
//  Created by Muhammad Abdul Ghani on 09/05/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: could not find and play the sound file!")
        }
    }
}
