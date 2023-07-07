//
//  SoundManager.swift
//  comee
//
//  Created by Nur Azizah on 27/06/23.
//

import Foundation
import AVKit

class SoundManager {
    //    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    var isPlaying: Bool = true
    
    func playBackgroundSound() {
        guard let url = Bundle.main.url(forResource: "soundBackground", withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
            player?.play()
            
        } catch let error {
            print("Error playing soung. \(error.localizedDescription)")
        }
        
    }
    
    func pauseBackgroundSound() {
        self.isPlaying = false
        player?.pause()
    }
    
    func resumeBackgroundSound() {
        self.isPlaying = true
        player?.play()
    }
}
