//
//  Photo+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo");
    }

    @NSManaged public var createTime: NSDate?
    @NSManaged public var photo: NSData?
    @NSManaged public var photoCategory: Int16
    @NSManaged public var updateTime: NSDate?
    @NSManaged public var photoDetail: PetDetails?

}
