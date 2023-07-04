//
//  SubPlan.swift
//  comee
//
//  Created by Nur Azizah on 29/06/23.
//

import Foundation

class SubPlan: Identifiable, ObservableObject {
    let id = UUID()
    @Published private var name: String
    @Published var is_done: Bool
    
    init(name: String, is_done: Bool) {
        self.name = name
        self.is_done = is_done
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getIsDone() -> Bool {
        return self.is_done
    }
    
    func setName(name: String) {
        self.name = name
        objectWillChange.send()
        
    }
    
    func setIsDone(is_done: Bool, subPlan: SubPlan) {
        subPlan.is_done = is_done
        objectWillChange.send()
        
    }
    
    func changeStatus(subPlan: SubPlan) {
        if subPlan.getIsDone() {
            subPlan.setIsDone(is_done: false, subPlan: subPlan)
        } else {
            subPlan.setIsDone(is_done: true, subPlan: subPlan)
        }
        //        objectWillChange.send()
        print("status change", subPlan.is_done)
    }
}
