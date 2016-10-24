//
//  ReminderSet+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class ReminderSet: NSManagedObject {

}

extension ReminderSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderSet> {
        return NSFetchRequest<ReminderSet>(entityName: "ReminderSet");
    }

    @NSManaged public var active: NSNumber?
    @NSManaged public var rmTimesPerDay: NSDate?
    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var reminder: NSSet?
    @NSManaged public var timeDate: RecordsTimeDate?

}

// MARK: Generated accessors for reminder
extension ReminderSet {

    @objc(addReminderObject:)
    @NSManaged public func addToReminder(_ value: RSTimesPerDay)

    @objc(removeReminderObject:)
    @NSManaged public func removeFromReminder(_ value: RSTimesPerDay)

    @objc(addReminder:)
    @NSManaged public func addToReminder(_ values: NSSet)

    @objc(removeReminder:)
    @NSManaged public func removeFromReminder(_ values: NSSet)

}
