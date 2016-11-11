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

    static func deleteObject(entityName: String, object: NSManagedObject) {
        let moc = getManagedObjectContext(entityName)
        moc.delete(object)

        do {
            try moc.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

    static func deleteAllData(entityName: String) {

        let moc = getManagedObjectContext(entityName)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.returnsObjectsAsFaults = false

        do {
            let results = try moc.fetch(fetchRequest) as! [NSManagedObject]
            for managedObject in results {
                let managedObjectData: NSManagedObject = managedObject
                moc.delete(managedObjectData)

                try moc.save()
            }
        } catch let error as NSError {
            NSLog("Detele all data in \(entityName) error : \(error) \(error.userInfo)")
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

    func saveContext(_ showLogInfo:Bool = false) {

        let statusSaving = save();

        if showLogInfo {
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
    }

    static func saveContextAndParentContexts(managedObjectContext: NSManagedObjectContext?) {
        self.saveContext(mo: managedObjectContext)
        if let parentContext = managedObjectContext?.parent {
            self.saveContext(mo: parentContext)
        }
    }

    //MARK: fetch some data
    private static func fetchRequestForEntity(entity: String,
                                              predicate: NSPredicate?,
                                              sortDescriptors: [NSSortDescriptor]?,
                                              otherOptions: Dictionary<String, Float>?
        ) -> NSFetchRequest<NSFetchRequestResult> {

        // Get the main object context
        let moc = getManagedObjectContext(entity)

        // Get the entity description
        let entityDescription = NSEntityDescription.entity(forEntityName: entity, in: moc)

        // Create the request
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = entityDescription

        if predicate != nil {
            request.predicate = predicate
        }

        request.sortDescriptors = sortDescriptors

        if let options = otherOptions as Dictionary? {
            for (key, value) in options {
                if key == "FetchLimit" {
                    request.fetchLimit = Int(value)
                } else if key == "BatchSize" {
                    request.fetchBatchSize = Int(value)
                }
            }
        }
        return request
    }

    static func fetchEntity(entityName: String,
                            predicate: NSPredicate?,
                            sortDescriptors: [NSSortDescriptor]?,
                            otherOptions: Dictionary<String, Float>?) -> [AnyObject]? {

        // Get the main object context
        let moc = getManagedObjectContext(entityName)

        let request = self.fetchRequestForEntity(entity: entityName,
                                                 predicate: predicate,
                                                 sortDescriptors: sortDescriptors,
                                                 otherOptions: otherOptions)

        var list: [AnyObject]?

        do {
            list = try moc.fetch(request) as? [NSManagedObject]
            // success ...
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")

            return nil
        }

        return list
    }

    static func fetchEntity(entityName: String, predicate: NSPredicate?) -> [AnyObject]? {
        return self.fetchEntity(entityName: entityName,
                                predicate: predicate,
                                sortDescriptors: nil,
                                otherOptions: nil)
    }

    static func fetchEntity(entityName: String,
                            predicate: NSPredicate?,
                            sortDescriptors: [NSSortDescriptor]?) -> [AnyObject]? {

        return self.fetchEntity(entityName: entityName,
                                predicate: predicate,
                                sortDescriptors: sortDescriptors,
                                otherOptions: nil)
    }

    static func countForEntity(entityName: String, predicate: NSPredicate) -> Int {
        // Get the main object context
        let moc = getManagedObjectContext(entityName)

        let request = self.fetchRequestForEntity(entity: entityName,
                                                 predicate: predicate,
                                                 sortDescriptors: nil,
                                                 otherOptions: nil)

        var count:Int
        do {
            count = try moc.count(for: request)
        } catch let error as NSError {
            print("Error returning results count: \(error). \(error.debugDescription)")
            count = 0
        }

        return count
    }


    //MARK:- getting smth
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
