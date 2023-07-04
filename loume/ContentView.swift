//
//  ContentView.swift
//  comee
//
//  Created by Probo Krishnacahya on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    //    @EnvironmentObject var userData: User
    @ObservedObject var userData: User
    @State var selectedTab = 0
    let instanceSoundManager = SoundManager()
    
    var body: some View {
        VStack {
            //            AppHeader(instanceSoundManager: instanceSoundManager)
            
            if userData.getName().isEmpty {
                TabView(selection: $selectedTab) {
                    GoalPage(userData: userData, backgroundColor: Color("Lotion"))
                        .tabItem {
                            Image(systemName: selectedTab == 0 ? "chart.bar.doc.horizontal.fill" : "chart.bar.doc.horizontal")
                                .environment(\.symbolVariants, .none)
                            
                            Text("Goals")
                        }
                        .tag(0)
                    
                    SummaryPage(backgroundColor: Color("Lotion"))
                        .tabItem {
                            Image(systemName: selectedTab == 1 ? "heart.circle.fill" : "heart.circle")
                                .environment(\.symbolVariants, .none)
                            
                            Text("About Me")
                        }
                        .tag(1)
                }
                .tint(Color("Axolotl"))
            } else {
                IntroductionPage(userData: userData, name: "")
            }
        }
        .onAppear {
            //instanceSoundManager.playBackgroundSound()
        }
        .onDisappear {
            instanceSoundManager.resumeBackgroundSound()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(userData: User(name: "", goals: []))
    }
}
