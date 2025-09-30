//
//  AsteroidsClassicSoundsManager.swift
//  AsteroidsClassicGame
//
//  Created by MIKHAIL ZHACHKO on 29.09.25.
//
  
import SwiftUI
import AVFoundation

final class AsteroidsClassicSoundManager {
    static let shared = AsteroidsClassicSoundManager()
    private var soundsPlayer: AVPlayer?
    private init() {}
    private func initiatePlayer(with item: AVPlayerItem) {
        soundsPlayer = AVPlayer(playerItem: item)
        soundsPlayer?.play()
    }
    func playSound(_ name: String) {
        guard AsteroidsClassicUserDefaults.isSoundOn else { return }
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            print("Error: Unable to find resource for \(name)")
            return
        }
        let item = AVPlayerItem(url: url)
        if soundsPlayer == nil {
            initiatePlayer(with: item)
        } else {
            soundsPlayer?.replaceCurrentItem(with: item)
            soundsPlayer?.play()
        }
    }
    func pauseTrack() {
        soundsPlayer?.pause()
        soundsPlayer = nil
    }
    func defaultButtonFeedback() {
        guard AsteroidsClassicUserDefaults.isSoundOn else { return }
        AudioServicesPlayAlertSound(1103)
    }
    func incorporateSoundEffects(_ song: String) {
        playSound(song)
    }
}
