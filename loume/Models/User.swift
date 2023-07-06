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
        self.objectWillChange.send()
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getGoals() -> [Goal]{
        return self.goals
    }
    
    func addGoal(name: String, plans: [Plan], dueDate: Date) {
        self.goals.append(Goal(name: name, plans: plans, dueDate: dueDate))
        self.objectWillChange.send()
    }
    
    func getDueDateFormat(dueDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyy"
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: dueDate)
    }
}
