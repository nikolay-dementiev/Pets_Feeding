//
//  MOCProtocol.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 11.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

protocol MOCProtocol {
    associatedtype ItemType

    static var nameOfCoreDataEntity: String {get};
    static var fields:TypeOfMOCFields {get set}

    func itemDesctiption() -> String
    func rewriteItemWithParameters (storage:StorageManager?,
                                    data dataForObject:TypeOfMOCFields,
                                    saveData:Bool?)
    static func insertNewInstance(storage:StorageManager?,
                                  data dataForObject:TypeOfMOCFields,
                                  saveData:Bool?) -> NSManagedObject?
    static func getItems(predicate:NSPredicate?) -> [ItemType]?

    //not required
    static func getStorageManager (_ storage:StorageManager?) -> StorageManager
}

extension MOCProtocol where Self: NSManagedObject {

    static func getStorageManager (_ storage:StorageManager?) -> StorageManager {
        return  storage ?? StorageManager.getSharedStorageManager(nameOfCoreDataEntity)
    }

    func itemDesctiption() -> String {
        var strForReturn:String = ""

        for (key, value) in Self.fields {
            //let tValue = value ?? "nil"
            let tValue = value
           // getValueFromAnyKey(val: &tValue)
            strForReturn += "\(strForReturn.characters.count > 0 ? ", " : "")'\(key)' = '\(tValue)'"
        }

        return "\(type(of: self)): \(strForReturn)"
    }

    static func getItems(predicate: NSPredicate?) -> [NSManagedObject]? {
        //let iSort = NSSortDescriptor(key: "name", ascending: true)
        //let predicate = NSPredicate(format: "item BEGINSWITH %@", "sd")

        let array = StorageManager.fetchEntity(entityName: nameOfCoreDataEntity,
                                               predicate: predicate,
                                               sortDescriptors: nil) as? [NSManagedObject]

        return array
    }


    func rewriteItemWithParameters (storage: StorageManager?,
                                    data dataForObject: TypeOfMOCFields,
                                    saveData: Bool?) {
        for (key, value) in dataForObject {
            if value != nil {
                self.setValue(value, forKey: key)
            }
        }

        if saveData != nil && saveData! {
            let dataStorage = UsedInAppPets.getStorageManager(storage)
            dataStorage.saveContext()
        }
    }

    static func insertNewInstance(storage: StorageManager?,
                                  data dataForObject: TypeOfMOCFields,
                                  saveData: Bool?) -> NSManagedObject? {

        let dataStorage = getStorageManager(storage)
        let objInstanse = dataStorage.insertNewObject(entityName: nameOfCoreDataEntity)!

        for (key, value) in dataForObject {
            if value != nil {
                let tVal = getValueFromField(fieldValue: value!)
                objInstanse.setValue(tVal, forKey: key)
            }
        }

        if saveData != nil && saveData! {
            dataStorage.saveContext()
        }
        
        return objInstanse
    }    
}

