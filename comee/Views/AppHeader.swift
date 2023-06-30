//
//  AppHeader.swift
//  comee
//
//  Created by Nur Azizah on 27/06/23.
//

import SwiftUI

struct AppHeader: View {
    @State var isClicked = false
    let instanceSoundManager: SoundManager
    
    var body: some View {
        VStack {
            Button(action: {
                if instanceSoundManager.isPlaying {
                    instanceSoundManager.pauseBackgroundSound()
                } else {
                    instanceSoundManager.resumeBackgroundSound()
                }
                isClicked.toggle()
            }, label: {
                Image(systemName: isClicked ? "speaker.slash.fill" : "speaker.wave.2.fill")
            })
        }
    }
}

struct AppHeader_Previews: PreviewProvider {
    static var previews: some View {
        AppHeader(instanceSoundManager: SoundManager())
    }
}
