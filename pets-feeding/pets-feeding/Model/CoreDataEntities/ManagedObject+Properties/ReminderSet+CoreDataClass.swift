//
//  ReminderSet+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class ReminderSet: NSManagedObject {

    static var fields:TypeOfMOCFields = ["active": FieldType(false),
                                         "petDetail": FieldType(PetDetails.self),
                                         "reminder": FieldType(RemindersAppStack.self),
                                         "createTime": FieldType(),
                                         "updateTime": FieldType()]
}

extension ReminderSet: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "ReminderSet"
    }

}
