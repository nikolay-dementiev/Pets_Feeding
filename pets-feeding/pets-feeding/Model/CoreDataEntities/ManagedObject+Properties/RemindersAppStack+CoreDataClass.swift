//
//  RemindersAppStack+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class RemindersAppStack: NSManagedObject {

    static var fields:TypeOfMOCFields = ["active": FieldType(false),
                                         "createTime": FieldType(),
                                         "dateProcessed": FieldType(),
                                         "dateScheduledOn": FieldType(),
                                         "idShedule": FieldType(),
                                         "pet": FieldType(UsedInAppPets.self),
                                         "createTime": FieldType(),
                                         "updateTime": FieldType()]
}

extension RemindersAppStack: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "RemindersAppStack"
    }
    
}
