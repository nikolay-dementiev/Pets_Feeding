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

    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var petRS: ReminderSet?
    @NSManaged public var photo: NSSet?

}

// MARK: Generated accessors for photo
extension PetDetails {

    @objc(addPhotoObject:)
    @NSManaged public func addToPhoto(_ value: Photo)

    @objc(removePhotoObject:)
    @NSManaged public func removeFromPhoto(_ value: Photo)

    @objc(addPhoto:)
    @NSManaged public func addToPhoto(_ values: NSSet)

    @objc(removePhoto:)
    @NSManaged public func removeFromPhoto(_ values: NSSet)

}
