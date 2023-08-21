//
//  sound.swift
//  mcOne
//
//  Created by Luthfi Asmara on 02/04/23.
//

import SwiftUI
import AVKit

class SoundService {
    static let instance = SoundService()
    var player: AVAudioPlayer?
    private func playSound(named name: String) {
        guard let soundUrl = Bundle.main.url(forResource: name, withExtension: "m4a") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            player = try AVAudioPlayer(contentsOf: soundUrl)
            player?.numberOfLoops = 0
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    func playNumberAwalSound(_ number: String) {
        let soundName = "\(number)"
        playSound(named: soundName)
    }
    func playNumberAkhirSound(_ number: String) {
        let soundName = "\(number)t"
        playSound(named: soundName)
    }
    func playBackgroundSound(_ soundLevel: String) {
        switch soundLevel {
        case "normal":
            playSound(named: "Tung tung")
            player?.volume = 1.0
        case "low":
            playSound(named: "Tung tung")
            player?.volume = 0.2
        default:
            break
        }
    }
    func playOperatorSound(_ operatorType: String) {
        switch operatorType {
        case "Dikurang":
            playSound(named: "Dikurang")
        case "Ditambah":
            playSound(named: "Ditambah")
        default:
            break
        }
    }
    func playSpecialSound(_ soundType: String) {
        switch soundType {
        case "ingatMinus":
            playSound(named: "ingatMinus")
        case "ingatPlus":
            playSound(named: "ingatPlus")
        case "nahMinus":
            playSound(named: "nahMinus")
        case "nahPlus":
            playSound(named: "nahPlus")
        case "jadi":
            playSound(named: "Jadi")
        case "samaDengan":
            playSound(named: "samaDengan")
        case "mariKitaHitungBersama":
            playSound(named: "mariKitaHitungBersama")
        default:
            break
        }
    }
}
