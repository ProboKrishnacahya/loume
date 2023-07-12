//
//  loumeApp.swift
//  loume
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

@main
struct loumeApp: App {
    @State var instanceSoundManager: SoundManager = SoundManager()
    @State var instanceAppHeaderViewModel: AppHeaderViewModel = AppHeaderViewModel()
    @State var instanceContentViewModel: ContentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(instanceSoundManager: $instanceSoundManager,
                        instanceAppHeaderViewModel: $instanceAppHeaderViewModel,
                        instanceContentViewModel: $instanceContentViewModel)
        }
    }
}
