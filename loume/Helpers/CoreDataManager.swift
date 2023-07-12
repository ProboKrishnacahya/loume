//
//  CoreDataManager.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "loume")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    //** USER **\\
    func addUserEntity(name: String) {
        let newUserEntity = UserEntity(context: context)
        newUserEntity.id = UUID()
        newUserEntity.name = name
        newUserEntity.created_at = Date()
        save()
    }
    
    func getUserEntityById(id: NSManagedObjectID) -> UserEntity? {
        do {
            return try context.existingObject(with: id) as? UserEntity
        } catch {
            return nil
        }
    }
    
    func getUserEntities() -> [UserEntity] {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteUserEntity(userEntity: UserEntity) {
        context.delete(userEntity)
        save()
    }
    
    func setNameUserEntity(userEntity: UserEntity, name: String) {
        userEntity.name = name
        save()
    }
    
    func setRoleModelUserEntity(userEntity: UserEntity, roleModel: String) {
        userEntity.role_model = roleModel
        save()
    }
    
    func setStrengthSimilarUserEntity(userEntity: UserEntity, strengthSimilar: String) {
        userEntity.strength_similar = strengthSimilar
        save()
    }
    
    func setStrength1UserEntity(userEntity: UserEntity, strength: String) {
        userEntity.strength1 = strength
        save()
    }
    
    func setStrength2UserEntity(userEntity: UserEntity, strength: String) {
        userEntity.strength2 = strength
        save()
    }
    
    func setStrength3UserEntity(userEntity: UserEntity, strength: String) {
        userEntity.strength3 = strength
        save()
    }
    
    func setWeakness1UserEntity(userEntity: UserEntity, weakness: String) {
        userEntity.weakness1 = weakness
        save()
    }
    
    func setWeakness2UserEntity(userEntity: UserEntity, weakness: String) {
        userEntity.weakness2 = weakness
        save()
    }
    
    func setWeakness3UserEntity(userEntity: UserEntity, weakness: String) {
        userEntity.weakness3 = weakness
        save()
    }
    
    //** GOAL **\\
    func addGoalEntity(name: String, dueDate: Date) {
        let newGoalEntity = GoalEntity(context: context)
        newGoalEntity.id = UUID()
        newGoalEntity.name = name
        newGoalEntity.due_date = dueDate
        newGoalEntity.created_at = Date()
        
        save()
    }
    
    func getGoalEntityById(id: NSManagedObjectID) -> GoalEntity? {
        do {
            return try context.existingObject(with: id) as? GoalEntity
        } catch {
            return nil
        }
    }
    
    func getGoalEntities() -> [GoalEntity] {
        let request: NSFetchRequest<GoalEntity> = GoalEntity.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "due_date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteGoalEntity(goalEntity: GoalEntity) {
        context.delete(goalEntity)
        save()
    }
    
    //** PLAN **\\
    func addPlanEntity(name: String, dueDate: Date, existingGoalEntity: GoalEntity) {
        let newPlanEntity = PlanEntity(context: context)
        newPlanEntity.id = UUID()
        newPlanEntity.name = name
        newPlanEntity.due_date = dueDate
        newPlanEntity.created_at = Date()
        newPlanEntity.goal = existingGoalEntity
        
        save()
        
        addSubPlanEntity(name: "", existingPlanEntity: newPlanEntity)
    }
    
    func getPlanEntityById(id: NSManagedObjectID) -> PlanEntity? {
        do {
            return try context.existingObject(with: id) as? PlanEntity
        } catch {
            return nil
        }
    }
    
    func getPlanEntities(goalEntity: GoalEntity) -> [PlanEntity] {
        let request: NSFetchRequest<PlanEntity> = PlanEntity.fetchRequest()
        let predicate = NSPredicate(format: "goal == %@", goalEntity)
        request.predicate = predicate
        
        let sortDescriptor = NSSortDescriptor(key: "due_date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    //** SUB PLAN **\\
    func addSubPlanEntity(name: String, existingPlanEntity: PlanEntity) {
        let newSubPlanEntity = SubPlanEntity(context: context)
        newSubPlanEntity.id = UUID()
        newSubPlanEntity.name = name
        newSubPlanEntity.is_done = false
        newSubPlanEntity.created_at = Date()
        newSubPlanEntity.plan = existingPlanEntity
        
        save()
    }
    
    func getSubPlanEntityById(id: NSManagedObjectID) -> SubPlanEntity? {
        do {
            return try context.existingObject(with: id) as? SubPlanEntity
        } catch {
            return nil
        }
    }
    
    func getSubPlanEntities(planEntity: PlanEntity) -> [SubPlanEntity] {
        let request: NSFetchRequest<SubPlanEntity> = SubPlanEntity.fetchRequest()
        let predicate = NSPredicate(format: "plan == %@", planEntity)
        request.predicate = predicate
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    func setIsDoneSubPlanEntity(subPlanEntity: SubPlanEntity) {
        subPlanEntity.is_done.toggle()
        save()
    }
    
    func setNameSubPlanEntity(subPlanEntity: SubPlanEntity, name: String) {
        subPlanEntity.name = name
        save()
    }
    
    //** LOVE **\\
    func addLoveEntity(interests: [String], selectedCircles: Set<Int>) {
        for selectedCircle in selectedCircles {
            let newLoveEntity = LoveEntity(context: context)
            newLoveEntity.id = UUID()
            newLoveEntity.name = interests[selectedCircle]
            newLoveEntity.created_at = Date()
            
            save()
        }
    }
    
    func updateLoveEntity(loveEntity: LoveEntity, interests: [String], selectedCircles: Set<Int>) {
        for selectedCircle in selectedCircles {
            loveEntity.name = interests[selectedCircle]
            save()
        }
    }
    
    func getLoveEntityById(id: NSManagedObjectID) -> LoveEntity? {
        do {
            return try context.existingObject(with: id) as? LoveEntity
        } catch {
            return nil
        }
    }
    
    func getLoveEntities() -> [LoveEntity] {
        let request: NSFetchRequest<LoveEntity> = LoveEntity.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteLoveEntity(loveEntity: LoveEntity) {
        context.delete(loveEntity)
        save()
    }
    
    func setRankLoveEntity(loveEntity: LoveEntity, rank: Int) {
        loveEntity.rank = Int64(rank)
        save()
    }
    
    //** ROLE MODEL STRENGTH **\\
    func addRoleModelStrengthEntity(value: String) {
        let newRoleModelStrengthEntity = RoleModelStrengthEntity(context: context)
        newRoleModelStrengthEntity.id = UUID()
        newRoleModelStrengthEntity.name = value
        newRoleModelStrengthEntity.created_at = Date()
        
        save()
    }
    
    func updateRoleModelStrengthEntity(existingRoleModelStrengthEntity: RoleModelStrengthEntity, value: String) {
        existingRoleModelStrengthEntity.name = value
        
        save()
    }
    
    func getRoleModelStrengthEntityById(id: NSManagedObjectID) -> RoleModelStrengthEntity? {
        do {
            return try context.existingObject(with: id) as? RoleModelStrengthEntity
        } catch {
            return nil
        }
    }
    
    func getRoleModelStrengthEntities() -> [RoleModelStrengthEntity] {
        let request: NSFetchRequest<RoleModelStrengthEntity> = RoleModelStrengthEntity.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch let error {
            print("Error fetching in Core Data. \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteRoleModelStrengthEntity(roleModelStrengthEntity: RoleModelStrengthEntity) {
        context.delete(roleModelStrengthEntity)
        save()
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}

