//
//  RoleModelStrengthEntity.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class RoleModelStrengthListCoreDataViewModel: ObservableObject {
    @Published var roleModelStrengthEntities: [RoleModelStrengthCoreDataModel] = []
    
    init() {
        deleteRoleModelStrengthEntityAll()
//        createDummyData()
    }
    
    func createDummyData() {
        saveRoleModelStrengthEntities(value1: "value1", value2: "value2", value3: "value3")
        getRoleModelStrengthEntities()
    }
    
    func deleteRoleModelStrengthEntityAll() {
        getRoleModelStrengthEntities()
        
        for roleModelStrengthEntity in roleModelStrengthEntities {
            deleteRoleModelStrength(roleModelStrengthCoreDataModel: roleModelStrengthEntity)
        }
    }
    
    func getRoleModelStrengthEntities() {
        roleModelStrengthEntities = CoreDataManager.instance.getRoleModelStrengthEntities().map(RoleModelStrengthCoreDataModel.init)
    }
    
    func saveRoleModelStrengthEntities(value1: String, value2: String, value3: String) {
        getRoleModelStrengthEntities()
        
        if roleModelStrengthEntities.isEmpty {
            if !value1.isEmpty {
                CoreDataManager.instance.addRoleModelStrengthEntity(value: value1)
            }
            
            if !value2.isEmpty {
                CoreDataManager.instance.addRoleModelStrengthEntity(value: value2)
            }
            
            if !value3.isEmpty {
                CoreDataManager.instance.addRoleModelStrengthEntity(value: value3)
            }
            
        } else {
            let existingRoleModelStrengthEntity = CoreDataManager.instance.getRoleModelStrengthEntityById(id: roleModelStrengthEntities[0].id)
            
            if let existingRoleModelStrengthEntity = existingRoleModelStrengthEntity {
                if !value1.isEmpty {
                    CoreDataManager.instance.updateRoleModelStrengthEntity(existingRoleModelStrengthEntity: existingRoleModelStrengthEntity, value: value1)
                }
                
                if !value2.isEmpty {
                    CoreDataManager.instance.updateRoleModelStrengthEntity(existingRoleModelStrengthEntity: existingRoleModelStrengthEntity, value: value2)
                }
                
                if !value3.isEmpty {
                    CoreDataManager.instance.updateRoleModelStrengthEntity(existingRoleModelStrengthEntity: existingRoleModelStrengthEntity, value: value3)
                }
            }
        }
        
        getRoleModelStrengthEntities()
    }
    
    func deleteRoleModelStrength(roleModelStrengthCoreDataModel: RoleModelStrengthCoreDataModel) {
        //        offsets.forEach { index in
        //            let userEntity = userEntities[index]
        //            delete(userEntity)
        //        }
        
        delete(roleModelStrengthCoreDataModel)
        getRoleModelStrengthEntities()
    }
    
    func delete(_ roleModelStrengthCoreDataModel: RoleModelStrengthCoreDataModel) {
        let existingRoleModelStrengthEntity = CoreDataManager.instance.getRoleModelStrengthEntityById(id: roleModelStrengthCoreDataModel.id)
        
        if let existingRoleModelStrengthEntity = existingRoleModelStrengthEntity {
            CoreDataManager.instance.deleteRoleModelStrengthEntity(roleModelStrengthEntity: existingRoleModelStrengthEntity)
        }
    }
}

struct RoleModelStrengthCoreDataModel: Identifiable {
    let roleModelStrengthEntity: RoleModelStrengthEntity
    
    var id: NSManagedObjectID {
        return roleModelStrengthEntity.objectID
    }
    
    var name: String {
        return roleModelStrengthEntity.name ?? ""
    }
}
