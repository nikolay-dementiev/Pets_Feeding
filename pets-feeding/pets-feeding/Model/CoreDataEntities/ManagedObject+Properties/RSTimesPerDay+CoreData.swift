//
//  RSTimesPerDay+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class RSTimesPerDay: NSManagedObject {

}

extension RSTimesPerDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RSTimesPerDay> {
        return NSFetchRequest<RSTimesPerDay>(entityName: "RSTimesPerDay");
    }

    @NSManaged public var active: Bool
    @NSManaged public var dayCategory: Int16
    @NSManaged public var id: String?
    @NSManaged public var time: NSData?
    @NSManaged public var reminderSet: ReminderSet?
    @NSManaged public var timeDate: RecordsTimeDate?

}
