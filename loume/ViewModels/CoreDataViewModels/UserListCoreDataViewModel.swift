//
//  UserListCoreDataViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class UserListCoreDataViewModel: ObservableObject {
    @Published var userEntities: [UserCoreDataModel] = []
    
    init() {
        //        addUserEntity(name: "aku 1")
        //        addUserEntity(name: "aku 2")
        //        addUserEntity(name: "aku 3")
        deleteUserEntityAll()
    }
    
    func deleteUserEntityAll() {
        getUserEntities()
        for userEntity in userEntities {
            deleteUser(userCoreDataModel: userEntity)
        }
    }
    
    func getUserEntities() {
        userEntities = CoreDataManager.instance.getUserEntities().map(UserCoreDataModel.init)
    }
    
    func addUserEntity(name: String) {
        let newUserEntity = UserEntity(context: CoreDataManager.instance.context)
        newUserEntity.id = UUID()
        newUserEntity.name = name
        newUserEntity.created_at = Date()
        CoreDataManager.instance.save()
        getUserEntities()
    }
    
    func deleteUser(userCoreDataModel: UserCoreDataModel) {
        //        offsets.forEach { index in
        //            let userEntity = userEntities[index]
        //            delete(userEntity)
        //        }
        
        delete(userCoreDataModel)
        getUserEntities()
    }
    
    func setRoleModel(userCoreDataModel: UserCoreDataModel, roleModel: String) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setRoleModelUserEntity(userEntity: existingUserEntity, roleModel: roleModel)
        }
        
        getUserEntities()
    }
    
    func setStrengthSimilar(userCoreDataModel: UserCoreDataModel, strengthSimilar: String) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setStrengthSimilarUserEntity(userEntity: existingUserEntity, strengthSimilar: strengthSimilar)
        }
        
        getUserEntities()
    }
    
    func setStrength(userCoreDataModel: UserCoreDataModel, strength: String) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            if userCoreDataModel.strength1.isEmpty {
                CoreDataManager.instance.setStrengthUserEntity1(userEntity: existingUserEntity, strength: strength)
            } else if userCoreDataModel.strength2.isEmpty {
                CoreDataManager.instance.setStrengthUserEntity2(userEntity: existingUserEntity, strength: strength)
            } else {
                CoreDataManager.instance.setStrengthUserEntity3(userEntity: existingUserEntity, strength: strength)
            }
        }
        
        getUserEntities()
    }
    
    func setWeakness(userCoreDataModel: UserCoreDataModel, weakness: String) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            if userCoreDataModel.weakness1.isEmpty {
                CoreDataManager.instance.setWeaknessUserEntity1(userEntity: existingUserEntity, weakness: weakness)
            } else if userCoreDataModel.weakness2.isEmpty {
                CoreDataManager.instance.setWeaknessUserEntity2(userEntity: existingUserEntity, weakness: weakness)
            } else {
                CoreDataManager.instance.setWeaknessUserEntity3(userEntity: existingUserEntity, weakness: weakness)
            }
        }
        
        getUserEntities()
    }
    
    func delete(_ userCoreDataModel: UserCoreDataModel) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.deleteUserEntity(userEntity: existingUserEntity)
        }
    }
}

struct UserCoreDataModel {
    let userEntity: UserEntity
    
    var id: NSManagedObjectID {
        return userEntity.objectID
    }
    
    var name: String {
        return userEntity.name ?? ""
    }
    
    var roleModel: String {
        return userEntity.role_model ?? ""
    }
    
    var strengthSimilar: String {
        return userEntity.strength_similar ?? ""
    }
    
    var strength1: String {
        return userEntity.strength1 ?? ""
    }
    
    var strength2: String {
        return userEntity.strength2 ?? ""
    }
    
    var strength3: String {
        return userEntity.strength3 ?? ""
    }
    
    var weakness1: String {
        return userEntity.weakness1 ?? ""
    }
    
    var weakness2: String {
        return userEntity.weakness2 ?? ""
    }
    
    var weakness3: String {
        return userEntity.weakness3 ?? ""
    }
}
