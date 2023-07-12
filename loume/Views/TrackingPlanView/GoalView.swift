//
//  Goals.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct GoalView: View {
    @State var inputTextValues: [[[String]]] = [[[""]]]
    @State var isSheetPresented: Bool = false
    
    let backgroundColor: Color
    
    @State var goalCoreDataModel = GoalCoreDataModel(goalEntity: GoalEntity())
    @ObservedObject var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @ObservedObject var planListCoreDataViewModel: PlanListCoreDataViewModel
    @ObservedObject var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 24) {
                        goalViewHeader
                        
                        goalList
                    }
                    .padding()
                }
                .navigationBarTitle("Goals")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }
            .tint(Color("Axolotl"))
        }
        .onAppear(perform: {
            goalListCoreDataViewModel.getGoalEntities()
        })
    }
    
    var goalViewHeader: some View {
        HStack {
            Text("Your Goals")
                .font(.largeTitle.bold())
            
            Spacer()
            
            CreateButton(isSheetPresented: $isSheetPresented,
                           inputTextValues: $inputTextValues, type: "goal", goal: $goalCoreDataModel, goalListCoreDataViewModel: goalListCoreDataViewModel,
                           planListCoreDataViewModel: planListCoreDataViewModel,
                           subPlanListCoreDataViewModel: subPlanListCoreDataViewModel,
                           goalIndex: 0)
        }
    }
    
    var goalList: some View {
        VStack {
            if goalListCoreDataViewModel.goalEntities.isEmpty {
                EmptyStateView(type: "Goal")
            } else {
                ForEach(Array(goalListCoreDataViewModel.goalEntities.enumerated()), id: \.0) { index, goal in
                    NavigationLink(destination: PlanView(inputTextValues: $inputTextValues,
                                                         goal: goal, goalIndex: index, goalListCoreDataViewModel: goalListCoreDataViewModel,
                                                         planListCoreDataViewModel: planListCoreDataViewModel,
                                                         subPlanListCoreDataViewModel: subPlanListCoreDataViewModel)) {
                        GoalRowView(goal: goal, planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel)
                    }
                }
            }
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(backgroundColor: Color("Lotion"), goalListCoreDataViewModel: GoalListCoreDataViewModel(),
                 planListCoreDataViewModel: PlanListCoreDataViewModel(),
                 subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel())
    }
}
