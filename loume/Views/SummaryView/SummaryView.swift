//
//  SummaryPage.swift
//  loume
//
//  Created by Probo Krishnacahya on 03/07/23.
//

import SwiftUI

struct SummaryView: View {
    
    @EnvironmentObject private var userListCoreDataViewModel: UserListCoreDataViewModel
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var loveListCoreDataViewModel: LoveListCoreDataViewModel
    @EnvironmentObject private var roleModelStrengthListCoreDataViewModel: RoleModelStrengthListCoreDataViewModel
    
    let backgroundColor: Color
    let summariesData = [
        SummaryData(title: "My\nInterest", background: Image("My Interest"), destination: AnyView(MyInterestView())),
        SummaryData(title: "My\nRole Model", background: Image("My Role Model"), destination: AnyView(MyRoleModelView())),
        SummaryData(title: "My\nWeakness", background: Image("My Weakness"), destination: AnyView(MyWeaknessView())),
        SummaryData(title: "Obstacles\nto My Goal", background: Image("Obstacles to My Goal"), destination: AnyView(MyGoalObstaclesView())),
        SummaryData(title: "My\nStrengths", background: Image("My Strengths"), destination: AnyView(MyStrengthsView()))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        Text("About Me")
                            .font(.largeTitle.bold())
                        
                        if userListCoreDataViewModel.userEntities.count == 0 || !userListCoreDataViewModel.userEntities[0].isJournalingFinished {
                            
                            EmptyStateView(type: "Summary")
                            
                        } else {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                                ForEach(summariesData) { summary in
                                    NavigationLink(destination: summary.destination) {
                                        SummaryContent(summariesData: summary)
                                    }
                                }
                            }
                            
                            PrimaryButton(label: "Reflect Again")
                                .onTapGesture {
                                    userListCoreDataViewModel.deleteUserEntityAll()
                                    goalListCoreDataViewModel.deleteGoalEntityAll()
                                    loveListCoreDataViewModel.deleteLoveEntityAll()
                                    roleModelStrengthListCoreDataViewModel.deleteRoleModelStrengthEntityAll()
                                    userListCoreDataViewModel.saveUserEntity(name: "")
                                }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("About Me")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .tint(Color("Axolotl"))
        }
        .onAppear(perform: {
            UINavigationBar.setAnimationsEnabled(false)
        })
    }
}

struct SummaryData: Identifiable {
    let id = UUID()
    let title: String
    let background: Image
    let destination: AnyView
}

struct SummaryContent: View {
    let summariesData: SummaryData
    
    var body: some View {
        ZStack {
            summariesData.background
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: .infinity)
            
            Text(summariesData.title)
                .font(.title3.bold())
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                .padding()
        }
        .cornerRadius(16)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(backgroundColor: Color("Lotion"))
    }
}
