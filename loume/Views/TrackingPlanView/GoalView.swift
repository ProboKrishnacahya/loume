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
    @ObservedObject var userData: User
    
    let backgroundColor: Color
    
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
    }
    
    var goalViewHeader: some View {
        HStack {
            Text("Your Goals")
                .font(.largeTitle.bold())
            
            Spacer()
            
            CircularButton(userData: userData, isSheetPresented: $isSheetPresented,
                           inputTextValues: $inputTextValues, dueDate: Date(), type: "goal", goal: Goal(name: "", plans: [], dueDate: Date()), goalIndex: 0)
        }
    }
    
    var goalList: some View {
        VStack {
            if userData.getGoals().isEmpty {
                EmptyStateView(type: "Goal")
            } else {
                ForEach(Array(userData.getGoals().enumerated()), id: \.0) { index, goal in
                    NavigationLink(destination: PlanView(userData: userData,
                                                         inputTextValues: $inputTextValues,
                                                         goal: goal, goalIndex: index)) {
                        GoalRowView(userData: userData, goal: goal)
                    }
                }
            }
        }
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(userData: User(name: "name 1", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]),
                 backgroundColor: Color("Lotion"))
    }
}
