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
        deleteUserEntityAll()
//        createDummyData()
    }
    
    func createDummyData() {
        saveUserEntity(name: "aku 1")
        setStrengthSimilar(strengthSimilar: "strength similar new value")
        setRoleModel(roleModel: "role model new value")
        setWeakness1(weakness: "weakness new value 1")
        setWeakness2(weakness: "weakness new value 2")
        setWeakness3(weakness: "weakness new value 3")
        setObstacle1(obstacle: "obstacle new value 1")
        setObstacle2(obstacle: "obstacle new value 2")
        setStrength1(strength: "strength new value 1")
        setStrength2(strength: "strength new value 2")
        setStrength3(strength: "strength new value 3")
        
        getUserEntities()
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
    
    func saveUserEntity(name: String) {
        getUserEntities()
        
        if userEntities.isEmpty {
            CoreDataManager.instance.addUserEntity(name: name)
        } else {
            let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userEntities[0].id)
            
            if let existingUserEntity = existingUserEntity {
                CoreDataManager.instance.setNameUserEntity(userEntity: existingUserEntity, name: name)
            }
        }
        
        getUserEntities()
    }
    
    func deleteUser(userCoreDataModel: UserCoreDataModel) {
        delete(userCoreDataModel)
        getUserEntities()
    }
    
    func delete(_ userCoreDataModel: UserCoreDataModel) {
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.deleteUserEntity(userEntity: existingUserEntity)
        }
    }
    
    func setRoleModel(roleModel: String) {
        getUserEntities()
        
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userEntities[0].id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setRoleModelUserEntity(userEntity: existingUserEntity, roleModel: roleModel)
        }
        
        getUserEntities()
    }
    
    func setStrengthSimilar(strengthSimilar: String) {
        getUserEntities()
        
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userEntities[0].id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setStrengthSimilarUserEntity(userEntity: existingUserEntity, strengthSimilar: strengthSimilar)
        }
        
        getUserEntities()
    }
    
    func setStrength1(strength: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setStrength1UserEntity(userEntity: existingUserEntity, strength: strength)
        }
        
        getUserEntities()
    }
    
    func setStrength2(strength: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setStrength2UserEntity(userEntity: existingUserEntity, strength: strength)
        }
        
        getUserEntities()
    }
    
    func setStrength3(strength: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setStrength3UserEntity(userEntity: existingUserEntity, strength: strength)
        }
        
        getUserEntities()
    }
    
    func setWeakness1(weakness: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setWeakness1UserEntity(userEntity: existingUserEntity, weakness: weakness)
        }
        
        getUserEntities()
    }
    
    func setWeakness2(weakness: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setWeakness2UserEntity(userEntity: existingUserEntity, weakness: weakness)
        }
        
        getUserEntities()
    }
    
    func setWeakness3(weakness: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setWeakness3UserEntity(userEntity: existingUserEntity, weakness: weakness)
        }
        
        getUserEntities()
    }
    
    func setObstacle1(obstacle: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setObstacle1UserEntity(userEntity: existingUserEntity, obstacle: obstacle)
        }
        
        getUserEntities()
    }
    
    func setObstacle2(obstacle: String) {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setObstacle2UserEntity(userEntity: existingUserEntity, obstacle: obstacle)
        }
        
        getUserEntities()
    }
    
    func setIsJournaling() {
        getUserEntities()
        
        let userCoreDataModel = userEntities[0]
        let existingUserEntity = CoreDataManager.instance.getUserEntityById(id: userCoreDataModel.id)
        
        if let existingUserEntity = existingUserEntity {
            CoreDataManager.instance.setIsJournalingUserEntity(userEntity: existingUserEntity)
        }
        
        getUserEntities()
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
    
    var obstacle1: String {
        return userEntity.obstacle1 ?? ""
    }
    
    var obstacle2: String {
        return userEntity.obstacle2 ?? ""
    }
    
    var isJournaling: Bool {
        return userEntity.is_journaling ?? false
    }
}
