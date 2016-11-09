//
//  GeneralPurpose.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation

struct GeneralPurpose {
    //static var shared = GeneralPurpose()

    static let nameOfCoreDataModelPF = "PetsFeeding"
//    static var dataStoragePF = StorageManager.getSharedStorageManager(nameOfCoreDataModelPF)

    static let arrayOfUsetDatabaseName: [String] = [nameOfCoreDataModelPF]

    static let dictionaryOfEntityName: [String: String] = [
        //DataBaseNameFromDatabaseName
        "PetsFeeding":arrayOfUsetDatabaseName[0],

        //DataBaseNameFromInstanceName
        UsedInAppPets.nameOfCoreDataEntity:arrayOfUsetDatabaseName[0]]
    
}
