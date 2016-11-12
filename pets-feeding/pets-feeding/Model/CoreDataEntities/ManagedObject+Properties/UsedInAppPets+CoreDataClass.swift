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

    static var fieldsOfClass:TypeOfMOCFields = ["activ": FieldType.asBool(false),
                                                "name": FieldType.asString(""),
                                                "createTime": FieldType.asNSDate(nil),
                                                "updateTime": FieldType.asNSDate(nil),
                                                "petDetails": nil,
                                                "petsRemAppStack": nil]

}

extension UsedInAppPets: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "UsedInAppPets"
    }

    static var fields: TypeOfMOCFields {
        get {
            return fieldsOfClass
        }
        set {
            fieldsOfClass = newValue
        }
    }

//    func itemDesctiption() -> String {
//        return "Pet name: '\(name!.description)" +
//            "', record is active: '\(activ.description)" +
//        "', last update time: '\(updateTime!.description)'"
//    }

//    func rewriteItemWithParameters (storage: StorageManager?,
//                                    data dataForObject: TypeOfMOCFields,
//                                    saveData: Bool?) {
//        for (key, value) in dataForObject {
//            if value != nil {
//                self.setValue(value, forKey: key)
//            }
//        }
//
//        if saveData != nil && saveData! {
//            let dataStorage = UsedInAppPets.getStorageManager(storage)
//            dataStorage.saveContext()
//        }
//    }

//    static func insertNewInstance(storage: StorageManager?,
//                                  data dataForObject: TypeOfMOCFields,
//                                  saveData: Bool?) -> NSManagedObject? {
//
//        let dataStorage = getStorageManager(storage)
//        let objInstanse: UsedInAppPets  = (dataStorage.insertNewObject(entityName: nameOfCoreDataEntity) as? UsedInAppPets)!
//
//        for (key, value) in dataForObject {
//            if value != nil {
//                objInstanse.setValue(value, forKey: key)
//            }
//        }
//
//        if saveData != nil && saveData! {
//            dataStorage.saveContext()
//        }
//
//        return objInstanse
//    }

//    static func getItems(predicate: NSPredicate?) -> [UsedInAppPets.ItemType]? {
//        let iSort = NSSortDescriptor(key: "name", ascending: true)
//        //        let predicate = NSPredicate(format: "item BEGINSWITH %@", "sd")
//        let array = StorageManager.fetchEntity(entityName: nameOfCoreDataEntity,
//                                               predicate: predicate,
//                                               sortDescriptors: [iSort]) as? [UsedInAppPets]
//        
//        return array
//    }
}
