//
//  UsedInAppPets+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class UsedInAppPets: NSManagedObject {

    static let nameOfCoreDataEntity = "UsedInAppPets"

    struct Fields {
        var activ: Bool = false
        var createTime: NSDate?
        var name: String?
        var updateTime: NSDate?
        var petDetails: PetDetails?
        var petsRemAppStack: NSSet?

    }
}

extension UsedInAppPets {

    func itemDesctiption() -> String {
        return "Pet name: '\(name?.description)" +
            "', record is active: '\(activ.description)" +
        "', last update time: '\(updateTime?.description)'"
    }

    static func insertNewInstance(storage: StorageManager?,
                                  data dataForObject: UsedInAppPets.Fields,
                                  saveData:Bool?) -> NSManagedObject? {

        let dataStorage = storage ?? StorageManager.getSharedStorageManager(nameOfCoreDataEntity)
        let objInstanse: UsedInAppPets  = (dataStorage.insertNewObject(entityName: nameOfCoreDataEntity) as? UsedInAppPets)!

        objInstanse.activ						= dataForObject.activ
        objInstanse.createTime			= dataForObject.createTime
        objInstanse.name						= dataForObject.name
        objInstanse.updateTime			= dataForObject.updateTime
        objInstanse.petDetails			= dataForObject.petDetails
        objInstanse.petsRemAppStack = dataForObject.petsRemAppStack

        if saveData != nil && saveData! {
            dataStorage.saveContext()
        }

        return objInstanse
    }

    static func getItems(predicate:NSPredicate?) -> [UsedInAppPets]? {
        let dateSort = NSSortDescriptor(key: "name", ascending: true)
        //        let predicate = NSPredicate(format: "item BEGINSWITH %@", "sd")
        let array = StorageManager.fetchEntity(entityName: nameOfCoreDataEntity,
                                               predicate: predicate,
                                               sortDescriptors: [dateSort]) as? [UsedInAppPets]
        
        return array
    }
    
    
}
