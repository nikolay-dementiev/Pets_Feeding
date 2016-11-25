//
//  UsedInAppPets+CoreDataClass.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData


public class UsedInAppPets: NSManagedObject {

    static var fields:TypeOfMOCFields = ["activ": FieldType(false),
                                                "name": FieldType(""),
                                                "petDetails": FieldType(PetDetails.self),
                                                "petsRemAppStack": FieldType(RemindersAppStack.self),
                                                "createTime": FieldType(),
                                                "updateTime": FieldType()]

}

extension UsedInAppPets: MOCProtocol {

    static var nameOfCoreDataEntity: String {
        return "UsedInAppPets"
    }

}
