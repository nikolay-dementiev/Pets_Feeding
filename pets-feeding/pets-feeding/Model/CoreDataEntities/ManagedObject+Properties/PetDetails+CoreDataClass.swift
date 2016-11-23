//
//  PetDetails+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class PetDetails: NSManagedObject {

    static var fields:TypeOfMOCFields = ["pet": FieldType(),
                                         "petRS": FieldType(),
                                         "photo": FieldType(),
                                         "createTime": FieldType(),
                                         "updateTime": FieldType()]
}

extension PetDetails: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "PetDetails"
    }

}
