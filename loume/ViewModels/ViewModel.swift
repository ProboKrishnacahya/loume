//
//  ViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation

class ViewModel {
    static let instance = ViewModel()
    
    func checkingForAddSubPlan(planCoreDataModel: PlanCoreDataModel, subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel) -> Bool {
        
        for subPlan in subPlanListCoreDataViewModel.getSubPlanEntitiesArray(planCoreDataModel: planCoreDataModel) {
            if subPlan.name.isEmpty {
                return true
            }
        }
        
        return false
    }
    
    func checkingGoalProgressBarValue(planListCoreDataViewModel: PlanListCoreDataViewModel, subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel, goal: GoalCoreDataModel) -> Double {
        if getPercentageProgress(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal) == 0 {
            return 1
        } else {
            return getPercentageProgress(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal)
        }
    }
    
    func getPercentageProgress(planListCoreDataViewModel: PlanListCoreDataViewModel, subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel, goal: GoalCoreDataModel) -> Double {
        var sumIsdone: Int = 0
        
        for plan in planListCoreDataViewModel.getPlanEntitiesArray(goalCoreDataModel: goal) {
            
            for subPlan in subPlanListCoreDataViewModel.getSubPlanEntitiesArray(planCoreDataModel: plan) {
                if subPlan.isDone {
                    sumIsdone += 1
                }
            }
        }
        
        let sumSubpPlan = sumSubPlan(planListCoreDataViewModel: planListCoreDataViewModel, subPlanListCoreDataViewModel: subPlanListCoreDataViewModel, goal: goal)
        return sumSubpPlan == 0 ? 0 : (Double(sumIsdone)/Double(sumSubpPlan))*100
    }
    
    func sumSubPlan(planListCoreDataViewModel: PlanListCoreDataViewModel, subPlanListCoreDataViewModel: SubPlanListCoreDataViewModel, goal: GoalCoreDataModel) -> Int {
        var sumSubPlan: Int = 0
        
        for plan in planListCoreDataViewModel.getPlanEntitiesArray(goalCoreDataModel: goal) {
            for subPlan in subPlanListCoreDataViewModel.getSubPlanEntitiesArray(planCoreDataModel: plan) {
                if !subPlan.name.isEmpty {
                    sumSubPlan += 1
                }
            }
        }
        
        return sumSubPlan
    }
    
    func getDueDateFormat(dueDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy"
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: dueDate)
    }
    
    func getTimeLeft(dueDate: Date) -> String {
        let calendar = Calendar.current
        var timeLeft = ""
        
        var dateComponents = DateComponents()
        dateComponents.year = calendar.component(.year, from: dueDate)
        dateComponents.month = calendar.component(.month, from: dueDate)
        dateComponents.day = calendar.component(.day, from: dueDate)
        
        if let targetDate = calendar.date(from: dateComponents) {
            let components = calendar.dateComponents([.day], from: Date(), to: targetDate)
            
            if let daysLeft = components.day {
                if daysLeft != 0 {
                    let years = calendar.dateComponents([.year, .month, .day], from: Date(), to: dueDate).year ?? 0
                    let months = calendar.dateComponents([.year, .month, .day], from: Date(), to: dueDate).month ?? 0
                    let days = calendar.dateComponents([.year, .month, .day], from: Date(), to: dueDate).day ?? 0
                    
                    var formattedTimeLeft = ""
                    
                    if years > 0 {
                        formattedTimeLeft += "\(years) \(years == 1 ? "year" : "years") "
                    }
                    if months > 0 {
                        formattedTimeLeft += "\(months) \(months == 1 ? "month" : "months") "
                    }
                    if days > 0 {
                        formattedTimeLeft += "\(days) \(days == 1 ? "day" : "days") "
                    }
                    
                    return formattedTimeLeft.trimmingCharacters(in: .whitespaces)
                    
                } else {
                    if dateComponents.day == calendar.component(.day, from: Date())+1 {
                        timeLeft = "Tomorrow"
                    } else if dateComponents.day == calendar.component(.day, from: Date()) {
                        timeLeft = "This Day"
                    } else {
                        timeLeft = "Passed"
                    }
                }
            }
        }
        
        return timeLeft
    }
}
