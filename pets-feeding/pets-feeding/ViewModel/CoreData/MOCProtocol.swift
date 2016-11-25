//
//  MOCProtocol.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 11.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

//extension NSManagedObject {
//    static var fieldsOfClass:TypeOfMOCFields = ["<none>": FieldType()]
//}

protocol MOCProtocol {
    associatedtype ItemType

    static var nameOfCoreDataEntity: String {get}
    static var fields:TypeOfMOCFields {get set}
    static var countOfItemInEntity: Int {get}

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
    static func syncFields(_ fields: TypeOfMOCFields)
}

extension MOCProtocol where Self: NSManagedObject {


    static var countOfItemInEntity: Int {
        return getItems(predicate: nil)?.count ?? 0
    }

    static func getStorageManager (_ storage:StorageManager?) -> StorageManager {
        return  storage ?? StorageManager.getSharedStorageManager(nameOfCoreDataEntity)
    }

    func itemDesctiption() -> String {
        var strForReturn:String = ""

        for (key, value) in Self.fields {
            //let tValue = value ?? "nil"
            let tValue = value.unwrap()

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

        //set data of record creations
        let currentDataForObject = Self.setDateTimeLog(data: dataForObject, forNewRecord: false)

        Self.syncFields(currentDataForObject)

        for (key, value) in currentDataForObject {

            if value.notNil() {
                let tVal = value.unwrap()
                self.setValue(tVal, forKey: key)
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

        //set data of record creations
        let currentDataForObject = setDateTimeLog(data: dataForObject, forNewRecord: true)

        syncFields(currentDataForObject)

        for (key, value) in currentDataForObject {

            if value.notNil() {
                let tVal = value.unwrap()

                objInstanse.setValue(tVal, forKey: key)
            }
        }

        if saveData != nil && saveData! {
            dataStorage.saveContext()
        }
        
        return objInstanse
    }

    private static func setDateTimeLog(data dataForObject: TypeOfMOCFields,
                               forNewRecord itIsNewRecord: Bool) -> TypeOfMOCFields {

        var currentDataForObject = dataForObject;
        let currentDateTimed = NSDate.getCurrentDate();

        currentDataForObject["updateTime"] = FieldType(currentDateTimed);

        if itIsNewRecord {
            currentDataForObject["createTime"] = FieldType(currentDateTimed);
        }

        return currentDataForObject
    }


    static func syncFields(_ fields: TypeOfMOCFields) {
        Self.fields = fields
    }

    //MARK: - protocol own methods
}

