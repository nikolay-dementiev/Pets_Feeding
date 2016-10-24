//
//  UsedInAppPets+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class UsedInAppPets: NSManagedObject {

}

extension UsedInAppPets {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UsedInAppPets> {
        return NSFetchRequest<UsedInAppPets>(entityName: "UsedInAppPets");
    }

    @NSManaged public var activ: Bool
    @NSManaged public var id: String?
    @NSManaged public var id_table: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var petDetails: PetDetails?
    @NSManaged public var petPhoto: NSSet?
    @NSManaged public var petRS: ReminderSet?
    @NSManaged public var petsRemAppStack: NSSet?
    @NSManaged public var timeDate: RecordsTimeDate?

}

// MARK: Generated accessors for petPhoto
extension UsedInAppPets {

    @objc(addPetPhotoObject:)
    @NSManaged public func addToPetPhoto(_ value: Photo)

    @objc(removePetPhotoObject:)
    @NSManaged public func removeFromPetPhoto(_ value: Photo)

    @objc(addPetPhoto:)
    @NSManaged public func addToPetPhoto(_ values: NSSet)

    @objc(removePetPhoto:)
    @NSManaged public func removeFromPetPhoto(_ values: NSSet)

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
