//
//  loumeApp.swift
//  loume
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

@main
struct loumeApp: App {
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        let standardAppearance = UITabBarAppearance()
        
        navigationBarAppearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        standardAppearance.backgroundEffect = UIBlurEffect(style: .systemThinMaterial)
        
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().standardAppearance = standardAppearance
        UITabBar.appearance().scrollEdgeAppearance = standardAppearance
    }
    
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
