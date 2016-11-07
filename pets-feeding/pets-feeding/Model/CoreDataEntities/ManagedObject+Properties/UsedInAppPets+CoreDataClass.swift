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

}

extension UsedInAppPets {

	
	static func insertNewInstance(
		//item: String?,
//	                                   checked: Bool?,
//	                                   createdDate: NSDate?,
//	                                   colorItem: UIColor?
	) -> NSManagedObject? {
		var dataStorage = GeneralPurpose.shared.dataStorage
		let usedInAppInstanse: UsedInAppPets  = (dataStorage.insertNewObject() as? UsedInAppPets)!

//		toDoItem.item           = item
//		toDoItem.checked        = checked ?? false
//
//		toDoItem.dateTimeCreate = createdDate
//		toDoItem.colorItem      = colorItem ?? self.getDefaultColorFortem()

		return usedInAppInstanse
	}

}
