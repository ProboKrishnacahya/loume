//
//  SubPlanListItemView.swift
//  loume
//
//  Created by Nur Azizah on 03/07/23.
//

import SwiftUI

struct SubPlanListItemView: View {
    @EnvironmentObject var userData: User
    var goalIndex: Int
    var groupIndex: Int
    var index: Int
    @Binding var inputTextValue: String
    
    var body: some View {
        HStack {
            Button(action: {
                var plan = userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex)
                
                plan.getSubPlanWithIndex(index: index)
                    .changeStatus(
                        subPlan:
                            userData.getSpesificPlanBasedGoal(
                                goal: userData.getGoalWithIndex(index: goalIndex),
                                planIndex: groupIndex
                            ).getSubPlanWithIndex(index: index)
                    )
                //                                                                            isClicked.toggle()
            }) {
                Circle()
                    .fill(userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex).getSubPlanWithIndex(index: index).getIsDone() ? Color("Axolotl") : .clear)
                    .frame(width: 16)
                    .overlay(
                        Circle()
                            .stroke(Color("Axolotl"), lineWidth: 2)
                    )
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.leading, 28)
            
            TextField(userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex).getSubPlanWithIndex(index: index).getName().isEmpty ? "New Subplan" : userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex).getSubPlanWithIndex(index: index).getName(),
                      text: $inputTextValue,
                      onCommit: {
                userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex).saveSubPlan(index: index, newSubPlan: inputTextValue, plan: userData.getSpesificPlanBasedGoal(goal: userData.getGoalWithIndex(index: goalIndex), planIndex: groupIndex))
            })
            .listRowBackground(Color.clear)
        }
        
    }
}

struct SubPlanListItemView_Previews: PreviewProvider {
    static var previews: some View {
        SubPlanListItemView(goalIndex: 0, groupIndex: 0, index: 0, inputTextValue: .constant(""))
            
    }
}
