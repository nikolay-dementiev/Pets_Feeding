//
//  ReminderSet+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension ReminderSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderSet> {
        return NSFetchRequest<ReminderSet>(entityName: "ReminderSet");
    }

    @NSManaged public var active: NSNumber?
    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var petDetail: PetDetails?
    @NSManaged public var reminder: NSSet?

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
