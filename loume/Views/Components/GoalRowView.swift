//
//  GoalRowView.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import SwiftUI

struct GoalRowView: View {
    @ObservedObject var userData: User
    
    var goal: Goal
    
    var body: some View {
        VStack(spacing: 16) {
            goalDescriptionContent
            
            Spacer()
            
            goalProgress
        }
        .padding()
        .background(Color("Axolotl"))
        .foregroundColor(.white)
        .cornerRadius(16)
    }
    
    var goalProgress: some View {
        HStack {
            goalProgressBar
            
            Text("\(String(format: "%.0f", goal.getPercentageProgress()))%")
                .font(.headline)
        }
    }
    
    var goalProgressBar: some View {
        ProgressView(value: Double(goal.getPercentageProgress()), total: 100)
            .progressViewStyle(.linear)
            .tint(Color("Light Moss Green"))
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .scaleEffect(x: CGFloat(checkingGoalProgressBarValue()), y: 1.0, anchor: .leading)
                }
            )
            .cornerRadius(6)
    }
    
    var goalDescriptionContent: some View {
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
                
                Text("\(goal.getPlans().count)")
            }
        }
    }
    
    func checkingGoalProgressBarValue() -> Double {
        if goal.getPercentageProgress() == 0 {
            return 1
        } else {
            return goal.getPercentageProgress()
        }
    }
}

struct GoalRowView_Previews: PreviewProvider {
    static var previews: some View {
        GoalRowView(userData: User(name: "name 1", goals: [Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date())]),
                    goal: Goal(name: "Goal 1", plans: [Plan(name: "Plan 1", subPlans: [SubPlan(name: "Sub Plan 1", is_done: false)], dueDate: Date())], dueDate: Date()))
    }
}
