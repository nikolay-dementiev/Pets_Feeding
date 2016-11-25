//
//  RSTimesPerDay+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension RSTimesPerDay {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RSTimesPerDay> {
        return NSFetchRequest<RSTimesPerDay>(entityName: "RSTimesPerDay");
    }

    @NSManaged public var active: Bool
    @NSManaged public var dayCategory: Int16
    @NSManaged public var timeScheduledOn: NSDate?
    @NSManaged public var reminderSet: ReminderSet?
    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?

}

extension RSTimesPerDay {
    //http://stackoverflow.com/a/26900521/6643923
    var stateDayCategory: DayCategory {
        get { return DayCategory(rawValue: self.dayCategory) ?? .none}
        set { self.dayCategory = newValue.rawValue}
    }
}
