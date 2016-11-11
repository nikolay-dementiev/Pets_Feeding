//
//  MOCProtocol.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 11.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

//class Fields {
//    var createTime: NSDate?
//    var updateTime: NSDate?
//
//    func setData(data:Fields) {
//        if data.createTime != nil && createTime != data.createTime {
//            createTime = data.createTime
//        }
//
//        if data.updateTime != nil && updateTime != data.updateTime {
//            updateTime = data.updateTime
//        }
//    }
//
//    func setData(createTime crTime:NSDate?,
//                      updateTime upTime:NSDate?) {
//        if crTime != nil && createTime != crTime {
//            createTime = crTime
//        }
//
//        if upTime != nil && updateTime != upTime {
//            updateTime = upTime
//        }
//    }
//}

protocol MOCProtocol {
    associatedtype ItemType

    static var nameOfCoreDataEntity: String {get};
    //static var fields:Fields {get set};
    //struct Fields
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
    static func getStorageManager (_ storage: StorageManager?) -> StorageManager
}

extension MOCProtocol {

    static func getStorageManager (_ storage: StorageManager?) -> StorageManager {
        return  storage ?? StorageManager.getSharedStorageManager(nameOfCoreDataEntity)
    }

//    private func keyIsValid(forKey key: String) -> Bool {
//        return Self.fields.index(forKey: key) != nil
//    }
//    subscript(key: String) -> ItemType {
//        get {
//            // return an appropriate subscript value here
//            assert(keyIsValid(forKey: key), "Key was not found")
//            return Self.fields[key] as! Self.ItemType
//        }
//        set(newValue) {
//            // perform a suitable setting action here
//            assert(keyIsValid(forKey: key), "Key was not found")
//            Self.fields[key] = newValue
//        }
//    }
}

//protocol subscriptToMOC {
//    associatedtype ItemType
//}
//
//extension subscriptToMOC {
//
//    subscript(key: String) -> Any? {
//        get {
//            let valueForReturn: Any?
//            switch key {
//            case "createTime":
//                valueForReturn = ItemType.valueForReturn
//            case "updateTime":
//                valueForReturn = ItemType.updateTime
//            default:
//                valueForReturn = nil
//            }
//
//            return valueForReturn
//        }
//        set(newValue) {
//            // perform a suitable setting action here
//            Self[key] = newValue
//        }
//    }
//
//}
