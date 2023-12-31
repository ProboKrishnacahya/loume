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
        deleteLoveEntityAll()
//        createDummyData()
    }
    
    func createDummyData() {
        var index = 1
        
        saveLoveEntity(interests: ["interest A", "interest B", "interest C"], selectedCircles: [0, 1, 2])
        getLoveEntities()
        
        for loveCoreDataModel in loveEntities {
            setRank(loveCoreDataModel: loveCoreDataModel, rank: index)
            index += 1
        }
        
        getLoveEntities()
    }
    
    func deleteLoveEntityAll() {
        getLoveEntities()
        
        for loveEntity in loveEntities {
            deleteLove(loveCoreDataModel: loveEntity)
        }
    }
    
    func deleteLove(loveCoreDataModel: LoveCoreDataModel) {
        delete(loveCoreDataModel)
        getLoveEntities()
    }
    
    func delete(_ loveCoreDataModel: LoveCoreDataModel) {
        let existingLoveEntity = CoreDataManager.instance.getLoveEntityById(id: loveCoreDataModel.id)
        
        if let existingLoveEntity = existingLoveEntity {
            CoreDataManager.instance.deleteLoveEntity(loveEntity: existingLoveEntity)
        }
    }
    
    func getLoveEntities() {
        loveEntities = CoreDataManager.instance.getLoveEntities().map(LoveCoreDataModel.init)
    }
    
    func saveLoveEntity(interests: [String], selectedCircles: Set<Int>) {
        getLoveEntities()
        
        if !loveEntities.isEmpty {
            deleteLoveEntityAll()
        }
        
        CoreDataManager.instance.addLoveEntity(interests: interests, selectedCircles: selectedCircles)
        getLoveEntities()
    }
    
    func getMostInterest() -> String {
        for loveEntity in loveEntities {
            if loveEntity.rank == 1 {
                return loveEntity.name
            }
        }
        
        return ""
    }
    
    func setRank(loveCoreDataModel: LoveCoreDataModel, rank: Int) {
        let existingLoveEntity = CoreDataManager.instance.getLoveEntityById(id: loveCoreDataModel.id)
        
        if let existingLoveEntity = existingLoveEntity {
            CoreDataManager.instance.setRankLoveEntity(loveEntity: existingLoveEntity, rank: rank)
        }
        
        getLoveEntities()
    }
}

struct LoveCoreDataModel: Identifiable {
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
