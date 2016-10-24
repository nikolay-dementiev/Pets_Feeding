//
//  Photo+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 19.10.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

public class Photo: NSManagedObject {

}

extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo");
    }

    @NSManaged public var id: String?
    @NSManaged public var photo: NSData?
    @NSManaged public var photoCategory: Int16
    @NSManaged public var pet: UsedInAppPets?
    @NSManaged public var photoDetail: PetDetails?
    @NSManaged public var timeDate: RecordsTimeDate?

}
