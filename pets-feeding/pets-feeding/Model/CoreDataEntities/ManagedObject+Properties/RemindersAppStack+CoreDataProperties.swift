//
//  RemindersAppStack+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension RemindersAppStack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RemindersAppStack> {
        return NSFetchRequest<RemindersAppStack>(entityName: "RemindersAppStack");
    }

    @NSManaged public var acive: Bool
    @NSManaged public var createTime: NSDate?
    @NSManaged public var dateProcessed: NSDate?
    @NSManaged public var dateScheduledOn: NSDate?
    @NSManaged public var idShedule: String?
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var pet: UsedInAppPets?

}
