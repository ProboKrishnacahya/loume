//
//  loumeApp.swift
//  loume
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

@main
struct loumeApp: App {
    @StateObject var userData = User(name: "", goals: [])
    @State var instanceSoundManager: SoundManager = SoundManager()
    @State var instanceAppHeaderViewModel: AppHeaderViewModel = AppHeaderViewModel()
    @State var instanceContentViewModel: ContentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(userData: userData, instanceSoundManager: $instanceSoundManager,
                        instanceAppHeaderViewModel: $instanceAppHeaderViewModel,
                        instanceContentViewModel: $instanceContentViewModel)
        }
    }
}
