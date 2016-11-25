//
//  RSTimesPerDay+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class RSTimesPerDay: NSManagedObject {

    static var fields:TypeOfMOCFields = ["active": FieldType(false),
                                         "stateDayCategory": FieldType(DayCategory.self),
                                         "timeScheduledOn": FieldType(),
                                         "reminderSet": FieldType(ReminderSet.self),
                                         "createTime": FieldType(),
                                         "updateTime": FieldType()]

}

extension RSTimesPerDay: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "RSTimesPerDay"
    }
    
}
