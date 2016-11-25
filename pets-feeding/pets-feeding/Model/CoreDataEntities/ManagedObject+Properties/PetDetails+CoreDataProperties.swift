//
//  PetDetails+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension PetDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetDetails> {
        return NSFetchRequest<PetDetails>(entityName: "PetDetails");
    }

    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var petRS: ReminderSet?
    @NSManaged public var petPhoto: PetPhoto?
    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?

}

// MARK: Generated accessors for photo
extension PetDetails {

    @objc(addPetPhotoObject:)
    @NSManaged public func addToPetPhoto(_ value: PetPhoto)

    @objc(removePhotoObject:)
    @NSManaged public func removeFromPetPhoto(_ value: PetPhoto)

    @objc(addPetPhoto:)
    @NSManaged public func addToPetPhoto(_ values: NSSet)

    @objc(removePetPhoto:)
    @NSManaged public func removeFromPetPhoto(_ values: NSSet)

}
