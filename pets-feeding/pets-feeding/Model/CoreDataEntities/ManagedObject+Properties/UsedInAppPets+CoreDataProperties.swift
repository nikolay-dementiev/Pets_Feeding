//
//  UsedInAppPets+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

extension UsedInAppPets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsedInAppPets> {
        return NSFetchRequest<UsedInAppPets>(entityName: "UsedInAppPets");
    }

    @NSManaged public var activ: Bool
    @NSManaged public var name: String?
    @NSManaged public var petDetails: PetDetails?
    @NSManaged public var petsRemAppStack: NSSet?
    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?

}

// MARK: Generated accessors for petsRemAppStack
extension UsedInAppPets {

    @objc(addPetsRemAppStackObject:)
    @NSManaged public func addToPetsRemAppStack(_ value: RemindersAppStack)

    @objc(removePetsRemAppStackObject:)
    @NSManaged public func removeFromPetsRemAppStack(_ value: RemindersAppStack)

    @objc(addPetsRemAppStack:)
    @NSManaged public func addToPetsRemAppStack(_ values: NSSet)

    @objc(removePetsRemAppStack:)
    @NSManaged public func removeFromPetsRemAppStack(_ values: NSSet)

}
