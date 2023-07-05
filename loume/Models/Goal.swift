//
//  Goal.swift
//  comee
//
//  Created by Nur Azizah on 28/06/23.
//

import Foundation

class Goal: Identifiable, ObservableObject {
    let id = UUID()
    @Published private var name: String
    @Published private var dueDate: Date
    @Published private var plans: [Plan]
    
    init(name: String, plans: [Plan], dueDate: Date) {
        self.name = name
        self.plans = plans
        self.dueDate = dueDate
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPlans() -> [Plan] {
        return self.plans
    }
    
    func getPlanWithIndex(planIndex: Int) -> Plan {
        return self.plans[planIndex]
    }
    
    func getDueDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy"
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: self.dueDate)
    }
    
    func getDueDateWithoutFormat() -> Date {
        return self.dueDate
    }
    
    func getTimeLeft() -> String {
        let calendar = Calendar.current
        var timeLeft = ""
        
        var dateComponents = DateComponents()
        dateComponents.year = calendar.component(.year, from: self.dueDate)
        dateComponents.month = calendar.component(.month, from: self.dueDate)
        dateComponents.day = calendar.component(.day, from: self.dueDate)
        
        if let targetDate = calendar.date(from: dateComponents) {
            let components = calendar.dateComponents([.day], from: Date(), to: targetDate)
            
            if let daysLeft = components.day {
                if daysLeft != 0 {
                    let years = calendar.dateComponents([.year, .month, .day], from: Date(), to: self.dueDate).year ?? 0
                    let months = calendar.dateComponents([.year, .month, .day], from: Date(), to: self.dueDate).month ?? 0
                    let days = calendar.dateComponents([.year, .month, .day], from: Date(), to: self.dueDate).day ?? 0
                    
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
    
    func addPlan(name: String, dueDate: Date, subPlans: [SubPlan]) {
        self.plans.append(Plan(name: name, subPlans: subPlans, dueDate: dueDate))
        self.objectWillChange.send()
    }
    
    func getPercentageProgress() -> Double {
        var sumIsdone: Int = 0
        var sumSubPlan: Int = 0
        
        for plan in self.plans {
            sumSubPlan += plan.getSubPlans().count
            for subPlan in plan.getSubPlans() {
                if subPlan.getIsDone() {
                    sumIsdone += 1
                }
            }
        }
        return sumSubPlan == 0 ? 0 : (Double(sumIsdone)/Double(sumSubPlan))*100
    }
    
    func sumIsDone() -> Int {
        var sumIsdone: Int = 0
        var sumSubPlan: Int = 0
        
        for plan in self.plans {
            sumSubPlan += plan.getSubPlans().count
            for subPlan in plan.getSubPlans() {
                if subPlan.getIsDone() {
                    sumIsdone += 1
                }
            }
        }
        
        return sumIsdone
    }
    
    func sumSubPlan() -> Int {
        var sumSubPlan: Int = 0
        
        for plan in self.plans {
            sumSubPlan += plan.getSubPlans().count
        }
        
        return sumSubPlan
    }
}
