//
//  PlanListCoreDataViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class PlanListCoreDataViewModel: ObservableObject {
    @Published var planEntities: [PlanCoreDataModel] = []
    
    func addPlanEntity(name: String, dueDate: Date, goalCoreDataModel: GoalCoreDataModel) {
        if let existingGoalEntity = CoreDataManager.instance.getGoalEntityById(id: goalCoreDataModel.id) {
            CoreDataManager.instance.addPlanEntity(name: name, dueDate: dueDate, existingGoalEntity: existingGoalEntity)
            
            getPlanEntities(goalCoreDataModel: goalCoreDataModel)
        }
    }
    
    func getPlanEntities(goalCoreDataModel: GoalCoreDataModel) {
        if let existingGoalEntity = CoreDataManager.instance.getGoalEntityById(id: goalCoreDataModel.id) {
            planEntities = CoreDataManager.instance.getPlanEntities(goalEntity: existingGoalEntity).map(PlanCoreDataModel.init)
        }
    }
    
    func getPlanEntitiesArray(goalCoreDataModel: GoalCoreDataModel) -> [PlanCoreDataModel] {
        if let existingGoalEntity = CoreDataManager.instance.getGoalEntityById(id: goalCoreDataModel.id) {
            
            return CoreDataManager.instance.getPlanEntities(goalEntity: existingGoalEntity).map(PlanCoreDataModel.init)
        }
        
        return []
    }
    
    func getExistingPlanEntity(planCoreDataModel: PlanCoreDataModel) -> PlanEntity? {
        return CoreDataManager.instance.getPlanEntityById(id: planCoreDataModel.id)
    }
    
    func getPlanEntityById(planCoreDataModel: PlanCoreDataModel) -> PlanCoreDataModel? {
        let existingPlanEntity = CoreDataManager.instance.getPlanEntityById(id: planCoreDataModel.id).map(PlanCoreDataModel.init)
        
        return existingPlanEntity
    }
}

struct PlanCoreDataModel {
    let planEntity: PlanEntity
    
    var id: NSManagedObjectID {
        return planEntity.objectID
    }
    
    var name: String {
        return planEntity.name ?? ""
    }
    
    var dueDate: Date {
        return planEntity.due_date ?? Date()
    }
    
    func getPlanEntity() -> PlanEntity {
        return planEntity
    }
    
    var subPlans: [SubPlanCoreDataModel] {
        if let subPlans = planEntity.sub_plans as? Set<SubPlanEntity> {
            return Array(subPlans).map(SubPlanCoreDataModel.init)
        } else {
            return []
        }
    }
}
