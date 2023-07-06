//
//  Goals.swift
//  comee
//
//  Created by Probo Krishnacahya on 27/06/23.
//

import SwiftUI

struct GoalPage: View {
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
                        HStack {
                            Text("Your Goals")
                                .font(.largeTitle.bold())
                            
                            Spacer()
                            
                            CircularButton(userData: userData, isSheetPresented: $isSheetPresented, dueDate: Date(), type: "goal", goal: Goal(name: "", plans: [], dueDate: Date()), inputTextValues: $inputTextValues, goalIndex: 0)
                        }
                        
                        VStack {
                            if userData.getGoals().isEmpty {
                                EmptyView(systemNameImage: "folder.badge.questionmark", type: "Goal")
                            } else {
                                ForEach(Array(userData.getGoals().enumerated()), id: \.0) { index, goal in
                                    NavigationLink(destination: PlanPage(userData: userData, inputTextValues: $inputTextValues, goal: goal, goalIndex: index)) {
                                        GoalResult(userData: userData, goal: goal)
                                    }
                                }
                            }
                        }
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
}

// Card for Goal Data
struct GoalResult: View {
    @ObservedObject var userData: User
    var goal: Goal
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(goal.getName())
                        .font(.title2.bold())
                    
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "calendar")
                    
                    Text(userData.getDueDateFormat(dueDate: goal.getDueDateWithoutFormat()) + " - " + goal.getTimeLeft())
                }
                
                HStack {
                    Image(systemName: "list.number")
                    
                    Text("\(goal.sumSubPlan())")
                }
            }
            
            Spacer()
            
            HStack {
                ProgressView(value: Double(goal.getPercentageProgress()), total: 100)
                    .progressViewStyle(.linear)
                    .tint(Color("Light Moss Green"))
                    .background(
                        GeometryReader { geometry in
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .scaleEffect(x: CGFloat(goal.getPercentageProgress() == 0 ? 1 : goal.getPercentageProgress()), y: 1.0, anchor: .leading)
                        }
                    )
                    .cornerRadius(6)
                
                Text("\(String(format: "%.0f", goal.getPercentageProgress()))%")
                    .font(.headline)
            }
        }
        .padding()
        .background(Color("Axolotl"))
        .foregroundColor(.white)
        .cornerRadius(16)
    }
}

struct GoalPage_Previews: PreviewProvider {
    static var previews: some View {
        GoalPage(userData: User(name: "", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]), backgroundColor: Color("Lotion"))
    }
}
