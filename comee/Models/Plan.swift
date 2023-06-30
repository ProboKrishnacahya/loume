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
    @Published var subPlans: [SubPlan]
    @Published var dueDate: Date
    
    init(name: String, subPlans: [SubPlan], dueDate: Date) {
        self.name = name
        self.subPlans = subPlans
        self.dueDate = dueDate
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getSubPlans() -> [SubPlan] {
        return self.subPlans
    }
    
    func getSubPlanWithIndex(index: Int) -> SubPlan {
        return self.getSubPlans()[index]
    }
    
    func getDueDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy"
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: self.dueDate)
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func addSubPlan(name: String, is_done: Bool, plan: Plan) {
        plan.subPlans.append(SubPlan(name: name, is_done: is_done))
    }
    
    func saveSubPlan(index: Int, newSubPlan: String, plan: Plan) {
        plan.subPlans[index].setName(name: newSubPlan)
    }
}
