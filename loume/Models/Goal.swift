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
        let currentDate = Date()
        var daysLeftKeep = 0
        
        var dateComponents = DateComponents()
        dateComponents.year = calendar.component(.year, from: self.dueDate)
        dateComponents.month = calendar.component(.month, from: self.dueDate)
        dateComponents.day = calendar.component(.day, from: self.dueDate)
        
        if let targetDate = calendar.date(from: dateComponents) {
            let components = calendar.dateComponents([.day], from: currentDate, to: targetDate)
            
            if let daysLeft = components.day {
                daysLeftKeep = daysLeft
            }
        }
        
        return daysLeftKeep == 0 ? "This Day" : "\(daysLeftKeep) Days Left"
    }
    
    func addPlan(name: String, dueDate: Date, subPlans: [SubPlan]) {
        self.plans.append(Plan(name: name, subPlans: subPlans, dueDate: dueDate))
        print("insert", plans.count)
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
        
        return sumSubPlan == 0 ? 0 : Double((Double(sumIsdone)/Double(sumSubPlan))*100)
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
