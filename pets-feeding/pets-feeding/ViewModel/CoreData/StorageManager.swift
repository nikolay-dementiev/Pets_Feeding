//
//  Storage.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//
//look there: https://gist.github.com/avdyushin/b67e4524edcfb1aec47605da1a4bea7a

import Foundation
//import UIKit
import CoreData

/// NSPersistentStoreCoordinator extension
extension NSPersistentStoreCoordinator {

    /// NSPersistentStoreCoordinator error types
    public enum CoordinatorError: Error {
        /// .momd file not found
        case modelFileNotFound
        /// NSManagedObjectModel creation fail
        case modelCreationError
        /// Gettings document directory fail
        case storePathNotFound
    }

    /// Return NSPersistentStoreCoordinator object
    static func coordinator(name: String) throws -> NSPersistentStoreCoordinator? {

        guard let modelURL = Bundle.main.url(forResource: name, withExtension: "momd") else {
            throw CoordinatorError.modelFileNotFound
        }

        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            throw CoordinatorError.modelCreationError
        }

        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)

        guard let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            throw CoordinatorError.storePathNotFound
        }

        do {
            let url = documents.appendingPathComponent("\(name).sqlite")
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true,
                            NSInferMappingModelAutomaticallyOption : true ]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: url,
                                               options: options)
        } catch {
            throw error
        }

        return coordinator
    }
}

class StorageManager {

    //	public var nameOfCoreDataModel: String {
    //			return GeneralPurpose.shared.nameOfCoreDataModel
    //	}

    private static var dictionaryOfInstance = [String: StorageManager?]()

    public var nameOfCoreDataModel: String = "PetsFeeding"
    //static var shared = StorageManager()

//    private let sharedStorageManager = StorageManager()
//    class var sharedInstance: StorageManager {
//        return sharedStorageManager
//    }

    private init(defUrlRes: String) {
        nameOfCoreDataModel = defUrlRes;
    }

    @available(iOS 10.0, *)
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: self.nameOfCoreDataModel)
        container.loadPersistentStores { (storeDescription, error) in
            print("CoreData: Inited \(storeDescription)")
            guard error == nil else {
                print("CoreData: Unresolved error \(error)")
                return
            }
        }
        return container
    }()

    lazy private(set) var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        do {
            let coordinator = try NSPersistentStoreCoordinator.coordinator(name: self.nameOfCoreDataModel)
            return coordinator
        } catch {
            print("CoreData: Unresolved error \(error)")
        }
        return nil
    }()

    lazy private(set) var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: Public methods

    enum SaveStatus {
        case saved, rolledBack, hasNoChanges, smth
    }

    var context: NSManagedObjectContext {
        get {
            if #available(iOS 10.0, *) {
                return persistentContainer.viewContext
            } else {
                return managedObjectContext
            }
        }
    }

    func insertNewObject(entityName nameOfCoreDataEntity: String) -> NSManagedObject? {
        return NSEntityDescription.insertNewObject(forEntityName: nameOfCoreDataEntity,
                                                   into: context)
    }


    static func getSharedInstance (key: String) -> StorageManager {
        let instanseToReturn: StorageManager
        
        if let val = dictionaryOfInstance[key] {
            //if key exist - get it from the stack
            instanseToReturn = val!
        } else {
            instanseToReturn = StorageManager(defUrlRes: key)
            //add instanse to dictionary
            dictionaryOfInstance[key] = instanseToReturn
        }
        
        return instanseToReturn
    }
    
}
