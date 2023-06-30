//
//  User.swift
//  comee
//
//  Created by Nur Azizah on 28/06/23.
//

import Foundation

class User: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name: String
    @Published var goals: [Goal]
    
    init(name: String, goals: [Goal]) {
        self.name = name
        self.goals = goals
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getGoals() -> [Goal]{
        return self.goals
    }
    
    func getGoalWithIndex(index: Int) -> Goal {
        return self.getGoals()[index]
    }
    
    func getGoalName(index: Int) -> String {
        return self.getGoals()[index].getName()
    }
    
    func addGoal(name: String, plans: [Plan], dueDate: Date) {
        self.goals.append(Goal(name: name, plans: plans, dueDate: dueDate))
    }
    
    func getSpesificPlanBasedGoalIndex(goalIndex: Int, planIndex: Int) -> Plan {
        return self.goals[goalIndex].plans[planIndex]
    }
    
    func getCountOfSubPlans(goalIndex: Int, planIndex: Int) -> Int {
        return self.getSpesificPlanBasedGoalIndex(goalIndex: goalIndex, planIndex: planIndex).subPlans.count
    }
}
