//
//  StorageUtil.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import Foundation
import CoreData

extension StorageManager {

	//MARK: Delete
	mutating func deleteObject(object: NSManagedObject) {
		let moc = context
		moc.delete(object)

		do {
			try moc.save()
		} catch {
			// Replace this implementation with code to handle the error appropriately.
			// abort() causes the application to generate a crash log and terminate.
			//You should not use this function in a shipping application,
			//although it may be useful during development.
			let nserror = error as NSError
			NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
			abort()
		}
	}


	//MARK: Save
	mutating func saveContext() {

		let statusSaving = save();

		if statusSaving == .rolledBack {
			NSLog("Unresolved error has occurred when saving data in CoreData was called")
			abort()
		}
	}

	mutating func save() -> SaveStatus {
		if context.hasChanges {
			do {
				try context.save()
				return .saved
			} catch {
				context.rollback()
				return .rolledBack
			}
		}
		return .hasNoChanges
	}

	
}
