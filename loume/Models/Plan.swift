//
//  Plan.swift
//  comee
//
//  Created by Nur Azizah on 28/06/23.
//

import Foundation

class Plan: Identifiable, ObservableObject {
    let id = UUID()
    @Published private var name: String
    @Published private var subPlans: [SubPlan]
    @Published private var dueDate: Date
    
    init(name: String, subPlans: [SubPlan], dueDate: Date) {
        self.name = name
        self.subPlans = subPlans
        self.dueDate = dueDate
    }
    
    func setName(name: String) {
        self.name = name
        self.objectWillChange.send()
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getSubPlans() -> [SubPlan] {
        return self.subPlans
    }
    
    func getDueDateWithoutFormat() -> Date {
        return self.dueDate
    }
    
    func addSubPlan(name: String, is_done: Bool) {
        self.subPlans.append(SubPlan(name: name, is_done: is_done))
        self.objectWillChange.send()
    }
    
    func checkingForAddSubPlan(inputTextValues: [[[String]]]) -> Bool {
        for subPlanIndex in self.getSubPlans().indices {
            if self.getSubPlans()[subPlanIndex].getName().isEmpty {
                return true
            }
        }
        
        return false
    }
}
