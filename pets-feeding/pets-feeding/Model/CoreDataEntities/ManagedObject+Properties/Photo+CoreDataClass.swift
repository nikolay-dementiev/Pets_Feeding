//
//  PetPhoto+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class PetPhoto: NSManagedObject {

    static var fields:TypeOfMOCFields = ["petPhoto": FieldType(NSData.self),
                                         "statePhotoCategory": FieldType(PhotoCategory.self),
                                         "photoDetail": FieldType(PetDetails.self),
                                         "createTime": FieldType(),
                                         "updateTime": FieldType()]

}

extension PetPhoto: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "PetPhoto"
    }
    
}
