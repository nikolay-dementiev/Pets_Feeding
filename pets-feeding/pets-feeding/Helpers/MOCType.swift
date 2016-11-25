//
//  MOC.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 11.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

typealias TypeOfMOCFields = Dictionary<String, FieldType<Any>>

public enum FieldType<T> {

    case someVal(T)
    case none

    init(_ value: T?) {
        if value == nil {
            self = .none
        } else {
            self = .someVal(value!)
        }
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
}
