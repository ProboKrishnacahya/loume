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
    @State var selectedTab = 0
    @Binding var instanceSoundManager: SoundManager
    @Binding var instanceAppHeaderViewModel: AppHeaderViewModel
    @Binding var instanceContentViewModel: ContentViewModel
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    @EnvironmentObject private var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @EnvironmentObject private var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @EnvironmentObject private var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    var body: some View {
        VStack {
            //          AppHeader(instanceSoundManager: $instanceSoundManager, instanceAppHeaderViewModel: $instanceAppHeaderViewModel)
            
            if userListCoreDataViewModel.userEntities.count != 0 {
                tabView
            } else {
                SetupProject(moveUp: true, moveUpCircle: true, moveUpText: true, isView2Active: false, moveUpTextField: true, fadeText1: false, offset: CGSize.zero, fadeText2: false, fadeOutCircle: 1, text1: 90, name: "", scale2: 1, userListCoreDataViewModel: userListCoreDataViewModel, goalListCoreDataViewModel: goalListCoreDataViewModel, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, loveListCoreDataViewModel: loveListCoreDataViewModel,
                             roleModelStrengthListCoreDataViewModel: roleModelStrengthListCoreDataViewModel)
            }
        }
        .preferredColorScheme(.light)
        .onAppear(perform: {
            userListCoreDataViewModel.getUserEntities()
            //instanceSoundManager.playBackgroundSound()
        })
        .onDisappear(perform: {
            instanceSoundManager.resumeBackgroundSound()
        })
    }
    
    var tabView: some View {
        TabView(selection: $selectedTab) {
            GoalView(backgroundColor: Color("Lotion"))
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
        ContentView(instanceSoundManager: .constant(SoundManager()),
                    instanceAppHeaderViewModel: .constant(AppHeaderViewModel()),
                    instanceContentViewModel: .constant(ContentViewModel()))
    }
}
