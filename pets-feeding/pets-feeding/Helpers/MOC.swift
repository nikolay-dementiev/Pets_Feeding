//
//  MOC.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 11.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

//protocol ccc {
//    associatedtype ItemType
//    func getValueFromField() -> ItemType
//}

public enum FieldType<T> {

    case asString(String?)
    case asBool(Bool?)
    case asInt(Int?)
    case asNSDate(NSDate?)
    case asMOCObj(NSManagedObject?)

    case asClosure((AnyObject)->String)

    func getValueFromField() -> T? {

        switch self {
        case .asBool(let b):
            return b as? T
        case .asString(let s):
            return s as? T
        case .asInt(let i):
            return i as? T
        case .asNSDate(let ns):
            return ns as? T
        case .asMOCObj(let moc):
            return moc as? T
        default:
            return nil
        }
    }
}

typealias TypeOfMOCFields = Dictionary<String, FieldType<Any>?>




//func getValueFromAnyKey(val: inout Any?) {
//
//    if val != nil {
//        switch val {
//        case is String:
//            val = val as! String
//        case is Bool:
//            val = val as! Bool
//        case is NSDate:
//             val = val as! NSDate
//        default:
//            NSLog("SMTH Wrong in value type of MOC")
//        }
//
//    }
//}
