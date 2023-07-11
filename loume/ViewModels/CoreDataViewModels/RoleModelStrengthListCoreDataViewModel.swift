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
        //        addUserEntity(name: "aku 1")
        //        addUserEntity(name: "aku 2")
        //        addUserEntity(name: "aku 3")
        deleteRoleModelStrengthEntityAll()
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
    
    func addRoleModelStrengthEntity(value: String) {
        let newRoleModelStrengthEntity = RoleModelStrengthEntity(context: CoreDataManager.instance.context)
        newRoleModelStrengthEntity.id = UUID()
        newRoleModelStrengthEntity.name = value
        newRoleModelStrengthEntity.created_at = Date()
        CoreDataManager.instance.save()
        getRoleModelStrengthEntities()
    }
    
    func addRoleModelStrengthEntities(value1: String, value2: String, value3: String) {
        deleteRoleModelStrengthEntityAll()
        addRoleModelStrengthEntity(value: value1)
        addRoleModelStrengthEntity(value: value2)
        addRoleModelStrengthEntity(value: value3)
    }
    
    func deleteRoleModelStrength(roleModelStrengthCoreDataModel: RoleModelStrengthCoreDataModel) {
        //        offsets.forEach { index in
        //            let userEntity = userEntities[index]
        //            delete(userEntity)
        //        }
        
        delete(roleModelStrengthCoreDataModel)
        getRoleModelStrengthEntities()
    }
    
//    func setRoleModel(userCoreDataModel: UserCoreDataModel, roleModel: String) {
//        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
//
//        if let existingUserEntity = existingUserEntity {
//            CoreDataManager.instance.setRoleModelUserEntity(userEntity: existingUserEntity, roleModel: roleModel)
//        }
//
//        getRoleModelStrengthEntities()
//    }
    
    func delete(_ roleModelStrengthCoreDataModel: RoleModelStrengthCoreDataModel) {
        let existingRoleModelStrengthEntity = CoreDataManager.instance.getRoleModelStrengthEntityById(id: roleModelStrengthCoreDataModel.id)
        
        if let existingRoleModelStrengthEntity = existingRoleModelStrengthEntity {
            CoreDataManager.instance.deleteRoleModelStrengthEntity(roleModelStrengthEntity: existingRoleModelStrengthEntity)
        }
    }
}

struct RoleModelStrengthCoreDataModel {
    let roleModelStrengthEntity: RoleModelStrengthEntity
    
    var id: NSManagedObjectID {
        return roleModelStrengthEntity.objectID
    }
    
    var name: String {
        return roleModelStrengthEntity.name ?? ""
    }
}
