//
//  User.swift
//  comee
//
//  Created by Nur Azizah on 28/06/23.
//

import Foundation

class User: Identifiable, ObservableObject {
    let id = UUID()
    @Published private var name: String
    @Published private var goals: [Goal]
    
    init(name: String, goals: [Goal]) {
        self.name = name
        self.goals = goals
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getGoals() -> [Goal]{
        return self.goals
    }
    
    func getGoalWithIndex(index: Int) -> Goal {
        return self.getGoals()[index]
    }
    
    func addGoal(name: String, plans: [Plan], dueDate: Date) {
        self.goals.append(Goal(name: name, plans: plans, dueDate: dueDate))
        print(goals.count)
        self.objectWillChange.send()
    }
}
