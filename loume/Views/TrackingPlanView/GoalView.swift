//
//  Goals.swift
//  loume
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct GoalView: View {
    
    @EnvironmentObject private var goalListCoreDataViewModel: GoalListCoreDataViewModel
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    @EnvironmentObject private var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
    @Binding var inputTextValues: [[[String]]]
    @State var isSheetPresented: Bool = false
    
    let backgroundColor: Color
    
    @State var goalCoreDataModel = GoalCoreDataModel(goalEntity: GoalEntity())
    
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
            
            inputTextValues = [[[""]]]
            
            for index in goalListCoreDataViewModel.goalEntities.indices {
                
                planListCoreDataViewModel.getPlanEntities(goalCoreDataModel: goalListCoreDataViewModel.goalEntities[index])
                
                if index > 0 {
                    inputTextValues.append([[""]])
                }
                
                for planIndex in goalListCoreDataViewModel.goalEntities[index].plans.indices {
                    
                    if planIndex > 0 {
                        inputTextValues[index].append([""])
                    }
                    
                    subPlanListCoreDataViewModel.getSubPlanEntities(planCoreDataModel: planListCoreDataViewModel.planEntities[planIndex])
                    
                    for subPlanIndex in subPlanListCoreDataViewModel.subPlanEntities.indices {
                        
                        if subPlanIndex > 0 {
                            inputTextValues[index][planIndex].append(subPlanListCoreDataViewModel.subPlanEntities[subPlanIndex].name)
                        } else {
                            inputTextValues[index][planIndex][0] = subPlanListCoreDataViewModel.subPlanEntities[subPlanIndex].name
                        }
                    }
                }
            }
        })
    }
    
    var goalViewHeader: some View {
        HStack {
            Text("Your Goals")
                .font(.largeTitle.bold())
            
            Spacer()
            
            CreateButton(isSheetPresented: $isSheetPresented,
                         inputTextValues: $inputTextValues, type: "goal", goal: $goalCoreDataModel, goalIndex: 0)
        }
    }
    
    var goalList: some View {
        VStack {
            if goalListCoreDataViewModel.goalEntities.isEmpty {
                EmptyStateView(type: "Goal")
            } else {
                ForEach(Array(goalListCoreDataViewModel.goalEntities.enumerated()), id: \.0) { index, goal in
                    NavigationLink(destination: PlanView(inputTextValues: $inputTextValues, goal: goal, goalIndex: index)) {
                        GoalRowView(goal: goal)
                    }
                }
            }
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(inputTextValues: .constant([[[""]]]), backgroundColor: Color("Lotion"))
            .environmentObject(GoalListCoreDataViewModel())
            .environmentObject(PlanListCoreDataViewModel())
            .environmentObject(SubPlanListCoreDataViewModel())
    }
}
