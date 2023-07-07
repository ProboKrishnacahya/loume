//
//  ContentView.swift
//  loume
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

extension View {
    func showTabItemStyle(selectedTab: Int, type: String, tag: Int,
                          instanceContentViewModel: ContentViewModel) -> some View {
        self
            .tabItem {
                Image(systemName: instanceContentViewModel.getImage(selectedTab: selectedTab, tag: tag, type: type))
                    .environment(\.symbolVariants, .none)
                
                Text(type)
            }
            .tag(tag)
    }
}

struct ContentView: View {
    @ObservedObject var userData: User
    @State var selectedTab = 0
    @Binding var instanceSoundManager: SoundManager
    @Binding var instanceAppHeaderViewModel: AppHeaderViewModel
    @Binding var instanceContentViewModel: ContentViewModel
    
    var body: some View {
        VStack {
            //          AppHeader(instanceSoundManager: $instanceSoundManager, instanceAppHeaderViewModel: $instanceAppHeaderViewModel)
            
            if userData.getName().isEmpty {
                tabView
            } else {
                IntroductionView(userData: userData,
                                 name: "")
            }
        }
        .preferredColorScheme(.light)
        .onAppear {
            //instanceSoundManager.playBackgroundSound()
        }
        .onDisappear {
            instanceSoundManager.resumeBackgroundSound()
        }
    }
    
    var tabView: some View {
        TabView(selection: $selectedTab) {
            GoalView(userData: userData, backgroundColor: Color("Lotion"))
                .showTabItemStyle(selectedTab: selectedTab, type: "Goals", tag: 0,
                                  instanceContentViewModel: instanceContentViewModel)
            
            SummaryView(backgroundColor: Color("Lotion"))
                .showTabItemStyle(selectedTab: selectedTab, type: "About Me", tag: 1,
                                  instanceContentViewModel: instanceContentViewModel)
        }
        .tint(Color("Axolotl"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: User(name: "", goals: []),
                    instanceSoundManager: .constant(SoundManager()),
                    instanceAppHeaderViewModel: .constant(AppHeaderViewModel()),
                    instanceContentViewModel: .constant(ContentViewModel()))
    }
}
