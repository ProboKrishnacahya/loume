//
//  AppHeaderViewModel.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import Foundation

struct AppHeaderViewModel {
    
    func toggleBackgroundSound(instanceSoundManager: SoundManager, isClicked: inout Bool) {
        if instanceSoundManager.isPlaying {
            instanceSoundManager.pauseBackgroundSound()
        } else {
            instanceSoundManager.resumeBackgroundSound()
        }
        isClicked.toggle()
    }
    
    func getBackgroundSoundIcon(isClicked: Bool) -> String {
        if isClicked {
            return "speaker.slash"
        } else {
            return "speaker.wave.2"
        }
    }
}
