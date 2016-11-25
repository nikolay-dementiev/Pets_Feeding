//
//  PetPhoto+CoreDataProperties.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


extension PetPhoto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetPhoto> {
        return NSFetchRequest<PetPhoto>(entityName: "PetPhoto");
    }

    @NSManaged public var petPhoto: NSData?
    @NSManaged public var photoCategory: Int16
    @NSManaged public var photoDetail: PetDetails?
    @NSManaged public var createTime: NSDate?
    @NSManaged public var updateTime: NSDate?

}

extension PetPhoto {
    //http://stackoverflow.com/a/26900521/6643923
    var statePhotoCategory: PhotoCategory {
        get { return PhotoCategory(rawValue: self.photoCategory) ?? .none}
        set { self.photoCategory = newValue.rawValue}
    }
}
