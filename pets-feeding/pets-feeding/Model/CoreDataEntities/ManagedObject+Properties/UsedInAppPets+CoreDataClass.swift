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

	static let nameOfCoreDataEntity = "UsedInAppPets"

	struct Fields {

		var activ: Bool = false
		var createTime: NSDate?
		var name: String?
		var updateTime: NSDate?
		var petDetails: PetDetails?
		var petsRemAppStack: NSSet?

	}

//	static func getUsedFields() -> Fields {
//		return Fields()
//	}

}

extension UsedInAppPets {

	static func insertNewInstance(_ dataForObject: UsedInAppPets.Fields) -> NSManagedObject? {
		var dataStorage = GeneralPurpose.shared.dataStorage
//		dataStorage.nameOfCoreDataModel = ""

		let objInstanse: UsedInAppPets  = (dataStorage.insertNewObject(entityName: nameOfCoreDataEntity) as? UsedInAppPets)!

//		toDoItem.item           = item
//		toDoItem.checked        = checked ?? false
//
//		toDoItem.dateTimeCreate = createdDate
//		toDoItem.colorItem      = colorItem ?? self.getDefaultColorFortem()

		objInstanse.activ						= dataForObject.activ
		objInstanse.createTime			= dataForObject.createTime
		objInstanse.name						= dataForObject.name
		objInstanse.updateTime			= dataForObject.updateTime
		objInstanse.petDetails			= dataForObject.petDetails
		objInstanse.petsRemAppStack = dataForObject.petsRemAppStack

		return objInstanse
	}

}
