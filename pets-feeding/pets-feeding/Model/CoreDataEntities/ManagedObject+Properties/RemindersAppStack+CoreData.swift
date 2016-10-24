//
//  RemindersAppStack+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class RemindersAppStack: NSManagedObject {

}

extension RemindersAppStack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RemindersAppStack> {
        return NSFetchRequest<RemindersAppStack>(entityName: "RemindersAppStack");
    }

    @NSManaged public var acive: Bool
    @NSManaged public var dateProcessed: NSDate?
    @NSManaged public var dateScheduledOn: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var timeDate: RecordsTimeDate?

}
