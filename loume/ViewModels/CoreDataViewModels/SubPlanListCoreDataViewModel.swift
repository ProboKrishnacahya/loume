//
//  SubPlanListCoreDataViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class SubPlanListCoreDataViewModel: ObservableObject {
    @Published var subPlanEntities: [SubPlanCoreDataModel] = []
    
    func setIsDoneSubPlanEntity(subPlanCoreDataModel: SubPlanCoreDataModel, planCoreDataModel: PlanCoreDataModel) {
        let existingSubPlanEntity = CoreDataManager.instance.getSubPlanEntityById(id: subPlanCoreDataModel.id)
        
        if let existingSubPlanEntity = existingSubPlanEntity {
            CoreDataManager.instance.setIsDoneSubPlanEntity(subPlanEntity: existingSubPlanEntity)
        }
        
        getSubPlanEntities(planCoreDataModel: planCoreDataModel)
    }
    
    func getSubPlanEntityById(subPlanCoreDataModel: SubPlanCoreDataModel) -> SubPlanCoreDataModel {
        let existingSubPlanEntity = CoreDataManager.instance.getSubPlanEntityById(id: subPlanCoreDataModel.id).map(SubPlanCoreDataModel.init)
        
        return existingSubPlanEntity!
    }
    
    func setNameSubPlanEntity(subPlanCoreDataModel: SubPlanCoreDataModel, name: String, planCoreDataModel: PlanCoreDataModel) {
        let existingSubPlanEntity = CoreDataManager.instance.getSubPlanEntityById(id: subPlanCoreDataModel.id)
        
        if let existingSubPlanEntity = existingSubPlanEntity {
            CoreDataManager.instance.setNameSubPlanEntity(subPlanEntity: existingSubPlanEntity, name: name)
        }
        
        getSubPlanEntities(planCoreDataModel: planCoreDataModel)
    }
    
    func addSubPlanEntity(name: String, planCoreDataModel: PlanCoreDataModel) {
        
        if let existingPlanEntity = CoreDataManager.instance.getPlanEntityById(id: planCoreDataModel.id) {
            let newSubPlanEntity = SubPlanEntity(context: CoreDataManager.instance.context)
            newSubPlanEntity.id = UUID()
            newSubPlanEntity.name = name
            newSubPlanEntity.is_done = false
            newSubPlanEntity.created_at = Date()
            newSubPlanEntity.plan = existingPlanEntity
            CoreDataManager.instance.save()
        }
        getSubPlanEntities(planCoreDataModel: planCoreDataModel)
    }
    
    func getSubPlanEntities(planCoreDataModel: PlanCoreDataModel) {
        if let existingPlanEntity = CoreDataManager.instance.getPlanEntityById(id: planCoreDataModel.id) {
            subPlanEntities = CoreDataManager.instance.getSubPlanEntities(planEntity: existingPlanEntity).map(SubPlanCoreDataModel.init)
        }
    }
    
    func getSubPlanEntitiesArray(planCoreDataModel: PlanCoreDataModel) -> [SubPlanCoreDataModel] {
        if let existingPlanEntity = CoreDataManager.instance.getPlanEntityById(id: planCoreDataModel.id) {
            return CoreDataManager.instance.getSubPlanEntities(planEntity: existingPlanEntity).map(SubPlanCoreDataModel.init)
        }
        return []
    }
}

struct SubPlanCoreDataModel {
    let subPlanEntity: SubPlanEntity
    
    var id: NSManagedObjectID {
        return subPlanEntity.objectID
    }
    
    var name: String {
        return subPlanEntity.name ?? ""
    }
    
    var isDone: Bool {
        return subPlanEntity.is_done
    }
}
