//
//  GoalListCoreDataViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class GoalListCoreDataViewModel: ObservableObject {
    @Published var goalEntities: [GoalCoreDataModel] = []
    
    init() {
        getGoalEntities()
        for goalEntity in goalEntities {
            deleteGoal(goalCoreDataModel: goalEntity)
        }
    }
    
    func deleteGoal(goalCoreDataModel: GoalCoreDataModel) {
        //        offsets.forEach { index in
        //            let userEntity = userEntities[index]
        //            delete(userEntity)
        //        }
        
        delete(goalCoreDataModel)
        getGoalEntities()
    }
    
    func delete(_ goalCoreDataModel: GoalCoreDataModel) {
        let existingGoalEntity = CoreDataManager.instance.getGoalEntityById(id: goalCoreDataModel.id)
        
        if let existingGoalEntity = existingGoalEntity {
            CoreDataManager.instance.deleteGoalEntity(goalEntity: existingGoalEntity)
        }
    }
    
    
    func getGoalEntities() {
        goalEntities = CoreDataManager.instance.getGoalEntities().map(GoalCoreDataModel.init)
    }
    
    func addGoalEntity(name: String, dueDate: Date) {
        let newGoalEntity = GoalEntity(context: CoreDataManager.instance.context)
        newGoalEntity.id = UUID()
        newGoalEntity.name = name
        newGoalEntity.due_date = dueDate
        newGoalEntity.created_at = Date()
        
        CoreDataManager.instance.save()
        getGoalEntities()
    }
    
    func getExistingGoalEntity(goalCoreDataModel: GoalCoreDataModel) -> GoalEntity? {
        return CoreDataManager.instance.getGoalEntityById(id: goalCoreDataModel.id)
    }
}

struct GoalCoreDataModel {
    let goalEntity: GoalEntity
    
    var id: NSManagedObjectID {
        return goalEntity.objectID
    }
    
    var name: String {
        return goalEntity.name ?? ""
    }
    
    var dueDate: Date {
        return goalEntity.due_date ?? Date()
    }
    
    var plans: [PlanCoreDataModel] {
        if let plans = goalEntity.plans as? Set<PlanEntity> {
            return Array(plans).map(PlanCoreDataModel.init)
        } else {
            return []
        }
    }
}
