//
//  RecordsTimeDate+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class RecordsTimeDate: NSManagedObject {

}

extension RecordsTimeDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecordsTimeDate> {
        return NSFetchRequest<RecordsTimeDate>(entityName: "RecordsTimeDate");
    }

    @NSManaged public var create_time: NSDate?
    @NSManaged public var update_time: NSDate?
    @NSManaged public var timeDatePetsDetails: PetDetails?
    @NSManaged public var timeDatePhoto: Photo?
    @NSManaged public var timeDateRAS: RemindersAppStack?
    @NSManaged public var timeDateRS: ReminderSet?
    @NSManaged public var timeDateRSTPD: RSTimesPerDay?
    @NSManaged public var timeDateUIAP: UsedInAppPets?

}
