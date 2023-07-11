//
//  LoveListCoreDataViewModel.swift
//  loume
//
//  Created by Nur Azizah on 11/07/23.
//

import Foundation
import CoreData

class LoveListCoreDataViewModel: ObservableObject {
    @Published var loveEntities: [LoveCoreDataModel] = []
    
    init() {
        //        addUserEntity(name: "aku 1")
        //        addUserEntity(name: "aku 2")
        //        addUserEntity(name: "aku 3")
        deleteLoveEntityAll()
        
        for i in 0...2 {
            let newLoveEntity = LoveEntity(context: CoreDataManager.instance.context)
            newLoveEntity.id = UUID()
            newLoveEntity.name = "Nyanyi"
            newLoveEntity.created_at = Date()
            CoreDataManager.instance.save()
        }
        getLoveEntities()
    }
    
    func deleteLoveEntityAll() {
        getLoveEntities()
        
        for loveEntity in loveEntities {
            deleteLove(loveCoreDataModel: loveEntity)
        }
    }
    
    func getLoveEntities() {
        loveEntities = CoreDataManager.instance.getLoveEntities().map(LoveCoreDataModel.init)
    }
    
    func addLoveEntity(interests: [String], selectedCircles: Set<Int>) {
        deleteLoveEntityAll()
        
        for selectedCircle in selectedCircles {
            let newLoveEntity = LoveEntity(context: CoreDataManager.instance.context)
            newLoveEntity.id = UUID()
            newLoveEntity.name = interests[selectedCircle]
            newLoveEntity.created_at = Date()
            CoreDataManager.instance.save()
        }
        getLoveEntities()
    }
    
    func getMostInterest() -> String {
        var highestRank = 0
        var mostlyInterest = ""
        
        for loveEntity in loveEntities {
            if loveEntity.rank > highestRank {
                mostlyInterest = loveEntity.name
                highestRank = loveEntity.rank
            }
        }
        
        return mostlyInterest
    }
    
    func setRank(loveCoreDataModel: LoveCoreDataModel, rank: Int) {
        let existingLoveEntity = CoreDataManager.instance.getLoveEntityById(id: loveCoreDataModel.id)
        
        if let existingLoveEntity = existingLoveEntity {
            CoreDataManager.instance.setRankLoveEntity(loveEntity: existingLoveEntity, rank: rank)
        }
        
        getLoveEntities()
    }
    
    func deleteLove(loveCoreDataModel: LoveCoreDataModel) {
        //        offsets.forEach { index in
        //            let userEntity = userEntities[index]
        //            delete(userEntity)
        //        }
        
        delete(loveCoreDataModel)
        getLoveEntities()
    }
    
    func delete(_ loveCoreDataModel: LoveCoreDataModel) {
        let existingLoveEntity = CoreDataManager.instance.getLoveEntityById(id: loveCoreDataModel.id)
        
        if let existingLoveEntity = existingLoveEntity {
            CoreDataManager.instance.deleteLoveEntity(loveEntity: existingLoveEntity)
        }
    }
}

struct LoveCoreDataModel {
    let loveEntity: LoveEntity
    
    var id: NSManagedObjectID {
        return loveEntity.objectID
    }
    
    var name: String {
        return loveEntity.name ?? ""
    }
    
    var rank: Int {
        return Int(loveEntity.rank)
    }
}
