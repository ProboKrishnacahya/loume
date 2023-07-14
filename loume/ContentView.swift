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
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    @EnvironmentObject private var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    @EnvironmentObject private var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @EnvironmentObject private var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    @State var selectedTab = 0
    @State var inputTextValues: [[[String]]] = [[[""]]]
    @State var condition1: Double = 0
    @State var condition2: Double = 0
    @State var condition3: Double = 0
    @State var isStrengthFulled: Bool = false
    @State var sumNullWeakness: Int = 0
    
    @Binding var instanceSoundManager: SoundManager
    @Binding var instanceAppHeaderViewModel: AppHeaderViewModel
    @Binding var instanceContentViewModel: ContentViewModel
    
    var body: some View {
        VStack {
            //          AppHeader(instanceSoundManager: $instanceSoundManager, instanceAppHeaderViewModel: $instanceAppHeaderViewModel)
            
            if userListCoreDataViewModel.userEntities.count == 0 {
                
                tabView
                
            } else {
                
                if userListCoreDataViewModel.userEntities[0].isJournaling {
                    
                    if !userListCoreDataViewModel.userEntities[0].pageTag.isEmpty {
                        
                        if userListCoreDataViewModel.userEntities[0].pageTag == "0" {
                            
                            RoleModelView()
                            
                        } else if userListCoreDataViewModel.userEntities[0].pageTag == "1" {
                            
                            StrengthOut()
                            
                        } else if userListCoreDataViewModel.userEntities[0].pageTag == "2" {
                            
                            AfterQuestion1View(condition1: $condition1, condition2: $condition2, condition3: $condition3, isStrengthFulled: $isStrengthFulled)
                            
                        } else if userListCoreDataViewModel.userEntities[0].pageTag == "3" {
                            
                            InterestPromiseView(sumNullWeakness: $sumNullWeakness)
                            
                        } else if
                            userListCoreDataViewModel.userEntities[0].pageTag == "4" {
                            //                                yohan
                            
                        } else if userListCoreDataViewModel.userEntities[0].pageTag == "5" {
                            
                            AfterObstacleView()
                            
                        }
                        
                    } else {
                        SetupProject(moveUp: true, moveUp2: true, moveUpCircle: true, moveUpText: true, isView2Active: false, moveUpTextField: true, fadeText1: false, offset: CGSize.zero, fadeText2: false, fadeOutCircle: 1, text1: 90, name: "", scale2: 1)
                    }
                    
                } else {
                    tabView
                }
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
            GoalView(inputTextValues: $inputTextValues, backgroundColor: Color("Lotion"))
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
