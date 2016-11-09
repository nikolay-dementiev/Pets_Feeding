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
    func deleteObject(object: NSManagedObject) {
        let moc = context
        moc.delete(object)

        do {
            try moc.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    //MARK: Save

    private func save() -> SaveStatus {
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


    static func saveAllContext() {
        for nameOfBD:String in GeneralPurpose.arrayOfUsetDatabaseName {
            saveContext(eName: nameOfBD)
        }
    }

    static func saveContext(eName: String) {
        let moc = getManagedObjectContext(eName) as NSManagedObjectContext
        saveContext(mo: moc)
    }

    static func saveContext(mo: NSManagedObjectContext?) {

        guard let moc = mo as NSManagedObjectContext! else {
            return
        }

        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

    func saveContext() {

        let statusSaving = save();

        switch statusSaving {
        case .rolledBack:
            NSLog("Unresolved error has occurred when saving data in CoreData was called")
        case .hasNoChanges:
            NSLog("There are no changes to save in CoreData")
        case .saved:
            NSLog("The data were successfully saved in CoreData")
        default:
            NSLog("Smth were wrong to save in CoreData")
        }
    }

    //getting
    static func getSharedStorageManager(_ entityName: String) -> StorageManager {

        let typeOfdata = getTypeOfDataUsingEntityName(entityName)

        let storageManager = StorageManager.getSharedInstance(key: typeOfdata)

        return storageManager
    }

    static func getManagedObjectContext(_ entityName: String) -> NSManagedObjectContext {

        let moc = getSharedStorageManager(entityName).context

        return moc
    }

    private static func getTypeOfDataUsingEntityName(_ entityName: String) -> String {
        
        return GeneralPurpose.dictionaryOfEntityName[entityName]! as String
    }
}
