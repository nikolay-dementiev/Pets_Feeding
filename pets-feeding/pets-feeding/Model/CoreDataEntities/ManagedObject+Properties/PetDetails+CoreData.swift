//
//  PetDetails+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class PetDetails: NSManagedObject {

}

extension PetDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetDetails> {
        return NSFetchRequest<PetDetails>(entityName: "PetDetails");
    }

    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var photo: NSSet?
    @NSManaged public var timeDate: RecordsTimeDate?

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
