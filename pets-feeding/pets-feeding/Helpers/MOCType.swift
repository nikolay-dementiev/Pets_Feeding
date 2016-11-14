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

//enum TypeOfMOCFields<Key: Hashable, Value: Hashable> {
//    typealias T = Dictionary<Key, Value?>//[Key: Value]
//}

public enum FieldType<T> {

    //    case asString(String?)
    //    case asBool(Bool?)
    //    case asInt(Int?)
    //    case asNSDate(NSDate?)
    //    case asMOCObj(NSManagedObject?)
    // case asClosure((AnyObject)->String)

    case someVal(T)
    case none

    init(_ value: T) {
        self = .someVal(value)
    }

    init() {
        self = .none
    }

    func unwrap() -> Any {
        switch self {
        case FieldType.someVal(let x):
            return x
        default:
            assert(true, "Unexpectedly found nil while unwrapping an optional value")
        }
        return FieldType.none
    }

    func unwrapWithCasting() -> CVarArg {
        if notNil() {
            return unwrap() as! CVarArg
        } else {
            return NSNull()
        }
    }

    func notNil() -> Bool {
        switch self {
        case FieldType.someVal:
            return true
        default:
            return false
        }
    }

//    func unwrapString() -> String {
//        let variableToReturn:String = unwrap() as! String
//
//        return variableToReturn
//    }

    //    func getValueFromField() -> T? {
    //
    //        switch self {
    //        case .asBool(let b):
    //            return b as? T
    //        case .asString(let s):
    //            return s as? T
    //        case .asInt(let i):
    //            return i as? T
    //        case .asNSDate(let ns):
    //            return ns as? T
    //        case .asMOCObj(let moc):
    //            return moc as? T
    //        default:
    //            return nil
    //        }
    //    }
}

//typealias FieldMOC = FieldType<Any>
typealias TypeOfMOCFields = Dictionary<String, FieldType<Any>>



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
