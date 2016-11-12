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

    //    static weak var fieldsOfClass:TypeOfMOCFields? = FieldsOfUsedInAppPets.sharedInstance;

    static var fieldsOfClass:TypeOfMOCFields = ["activ":false,
                                                "name":"",
                                                "createTime":nil,
                                                "updateTime":nil,
                                                "petDetails":nil,
                                                "petsRemAppStack":nil]

}


//class FieldsOfUsedInAppPets: Fields {
//    static let sharedInstance = FieldsOfUsedInAppPets()
//
//    //current fields
//    var activ: Bool? = false
//    var name: String?
//    var petDetails: PetDetails?
//    var petsRemAppStack: NSSet?
//
//    //setting method
//    override func setData(data:Fields) {
//        let tdata = data as! FieldsOfUsedInAppPets
//        super.setData(data: tdata)
//
//        activ = tdata.activ
//        name =  tdata.name
//        petDetails = tdata.petDetails
//        petsRemAppStack =  tdata.petsRemAppStack
//    }
//
//    func setData(activ: Bool?,
//                      name: String?,
//                      petDetails: PetDetails?,
//                      petsRemAppStack: NSSet?,
//                      createTime crTime: NSDate?,
//                      updateTime upTime: NSDate?) {
//
//        super.setData(createTime: crTime, updateTime: upTime)
//
//        self.activ = activ ?? false
//        self.name = name
//        self.petDetails = petDetails
//        self.petsRemAppStack =  petsRemAppStack
//    }
//}

extension UsedInAppPets: MOCProtocol {

    static var nameOfCoreDataEntity:String {
        get {
            return "UsedInAppPets"
        }
    }

    static var fields:TypeOfMOCFields {
        get {
            return fieldsOfClass
        }
        set {
            //fieldsOfClass?.setData(data: fields)
            fieldsOfClass = newValue
        }
    }

    func itemDesctiption() -> String {
        return "Pet name: '\(name!.description)" +
            "', record is active: '\(activ.description)" +
        "', last update time: '\(updateTime!.description)'"
    }

    func rewriteItemWithParameters (storage: StorageManager?,
                                    data dataForObject: TypeOfMOCFields,
                                    saveData:Bool?) {

        //        let settedData = dataForObject// as! FieldsOfUsedInAppPets

        //        if settedData.activ != nil && activ != settedData.activ {
        //            activ = settedData.activ!
        //        }
        //        if settedData.name != nil && name != settedData.name {
        //            name = settedData.name!
        //        }
        //        if settedData.petDetails != nil && petDetails != settedData.petDetails {
        //            petDetails = settedData.petDetails!
        //        }
        for (key, value) in dataForObject {
            if value != nil {
                //self[key] = value!
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
        let objInstanse: UsedInAppPets  = (dataStorage.insertNewObject(entityName: nameOfCoreDataEntity) as? UsedInAppPets)!

        //        let settedData = dataForObject// as! FieldsOfUsedInAppPets

        //        objInstanse.activ						= settedData.activ ?? false
        //        objInstanse.createTime			= settedData.createTime
        //        objInstanse.name						= settedData.name
        //        objInstanse.updateTime			= settedData.updateTime
        //        objInstanse.petDetails			= settedData.petDetails
        //        objInstanse.petsRemAppStack = settedData.petsRemAppStack
        for (key, value) in dataForObject {
            if value != nil {
                //objInstanse[key] = value!
                objInstanse.setValue(value, forKey: key)
            }
        }

        if saveData != nil && saveData! {
            dataStorage.saveContext()
        }

        return objInstanse
    }

    static func getItems(predicate:NSPredicate?) -> [NSManagedObject]? {
        let iSort = NSSortDescriptor(key: "name", ascending: true)
        //        let predicate = NSPredicate(format: "item BEGINSWITH %@", "sd")
        let array = StorageManager.fetchEntity(entityName: nameOfCoreDataEntity,
                                               predicate: predicate,
                                               sortDescriptors: [iSort]) as? [UsedInAppPets.ItemType]

        return array
    }
}

//MARK: subscript

//extension UsedInAppPets {
//
//    subscript(key: String) -> Any? {
//        get {
//            // return an appropriate subscript value here
//            let valueForReturn: Any?
//            switch key {
//            case "activ":
//                valueForReturn = activ
//            case "name":
//                valueForReturn = name
//            case "petDetails":
//                valueForReturn = petDetails
//            case "petsRemAppStack":
//                valueForReturn = petsRemAppStack
//            case "createTime":
//                valueForReturn = createTime
//            case "updateTime":
//                valueForReturn = updateTime
//            default:
//                valueForReturn = nil
//            }
//
//            return valueForReturn
//        }
//        set(newValue) {
//            // perform a suitable setting action here
//            switch key {
//            case "activ":
//                activ = (newValue ?? false) as! Bool
//            case "name":
//                name = newValue as? String
//            case "petDetails":
//                petDetails = newValue as? PetDetails
//            case "petsRemAppStack":
//                petsRemAppStack = newValue as? NSSet
//            case "createTime":
//                createTime = newValue as? NSDate
//            case "updateTime":
//                updateTime = newValue as? NSDate
//            default:
//                NSLog("Unknown key '\(key)'")
//            }
//        }
//    }
//}


//extension UsedInAppPets {
//
//    static let nameOfCoreDataEntity = "UsedInAppPets"
//
//    struct Fields {
//        var activ: Bool? = false
//        var createTime: NSDate?
//        var name: String?
//        var updateTime: NSDate?
//        var petDetails: PetDetails?
//        var petsRemAppStack: NSSet?
//    }
//
//    func itemDesctiption() -> String {
//        return "Pet name: '\(name?.description)" +
//            "', record is active: '\(activ.description)" +
//        "', last update time: '\(updateTime?.description)'"
//    }
//
//    func rewriteItemWithParameters (storage: StorageManager?,
//                                    data dataForObject: UsedInAppPets.Fields,
//                                    saveData:Bool?) {
//
//        if dataForObject.activ != nil && activ != dataForObject.activ {
//            activ = dataForObject.activ!
//        }
//        if dataForObject.name != nil && name != dataForObject.name {
//            name = dataForObject.name!
//        }
//        if dataForObject.petDetails != nil && petDetails != dataForObject.petDetails {
//            petDetails = dataForObject.petDetails!
//        }
//
//        if saveData != nil && saveData! {
//            let dataStorage = UsedInAppPets.getStorageManager(storage)
//            dataStorage.saveContext()
//        }
//
//    }
//
//    static func getStorageManager (_ storage: StorageManager?) -> StorageManager {
//        return  storage ?? StorageManager.getSharedStorageManager(nameOfCoreDataEntity)
//    }
//
//    static func insertNewInstance(storage: StorageManager?,
//                                  data dataForObject: UsedInAppPets.Fields,
//                                  saveData:Bool?) -> NSManagedObject? {
//
//        let dataStorage = getStorageManager(storage)
//        let objInstanse: UsedInAppPets  = (dataStorage.insertNewObject(entityName: nameOfCoreDataEntity) as? UsedInAppPets)!
//
//        objInstanse.activ						= dataForObject.activ ?? false
//        objInstanse.createTime			= dataForObject.createTime
//        objInstanse.name						= dataForObject.name
//        objInstanse.updateTime			= dataForObject.updateTime
//        objInstanse.petDetails			= dataForObject.petDetails
//        objInstanse.petsRemAppStack = dataForObject.petsRemAppStack
//
//        if saveData != nil && saveData! {
//            dataStorage.saveContext()
//        }
//
//        return objInstanse
//    }
//
//    static func getItems(predicate:NSPredicate?) -> [UsedInAppPets]? {
//        let dateSort = NSSortDescriptor(key: "name", ascending: true)
//        //        let predicate = NSPredicate(format: "item BEGINSWITH %@", "sd")
//        let array = StorageManager.fetchEntity(entityName: nameOfCoreDataEntity,
//                                               predicate: predicate,
//                                               sortDescriptors: [dateSort]) as? [UsedInAppPets]
//
//        return array
//    }
//
//    
//}
