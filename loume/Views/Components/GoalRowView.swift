//
//  GoalRowView.swift
//  loume
//
//  Created by Nur Azizah on 07/07/23.
//

import SwiftUI

struct GoalRowView: View {
    
    @EnvironmentObject private var planListCoreDataViewModel: PlanListCoreDataViewModel
    @EnvironmentObject private var subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel
    
    var goal: GoalCoreDataModel
    
    let viewModel = ViewModel()
    
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
            
            Text("\(String(format: "%.0f", viewModel.getPercentageProgress(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal)))%")
                .font(.headline)
        }
    }
    
    var goalProgressBar: some View {
        ProgressView(value: Double(viewModel.getPercentageProgress(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal)), total: 100)
            .progressViewStyle(.linear)
            .tint(Color("Light Moss Green"))
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .scaleEffect(x: CGFloat(viewModel.checkingGoalProgressBarValue(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal)), y: 1.0, anchor: .leading)
                }
            )
            .cornerRadius(6)
    }
    
    var goalDescriptionContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(goal.name)
                    .font(.title2.bold())
                Spacer()
            }
            
            HStack {
                Image(systemName: "calendar")
                Text(viewModel.getDueDateFormat(dueDate: goal.dueDate) + " - " + viewModel.getTimeLeft(dueDate: goal.dueDate))
            }
            
            HStack {
                Image(systemName: "list.number")
                Text("\(goal.plans.count)")
            }
        }
    }
}

struct GoalRowView_Previews: PreviewProvider {
    static var previews: some View {
        GoalRowView(goal: GoalCoreDataModel.init(goalEntity: GoalEntity()))
    }
}
