//
//  CoreDataTests.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 07.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import XCTest
@testable import pets_feeding

class CoreDataTests: XCTestCase {

    private let ourEntityName = GeneralPurpose.nameOfCoreDataModelPF
    private var dataStorageForTest:StorageManager?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStorageForTest = StorageManager.getSharedStorageManager(ourEntityName)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        dataStorageForTest = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCoreData_UsedInAppPets() {
        let initCount = UsedInAppPets.getItems(predicate: nil)?.count ?? 0
        var currentCount = initCount

        let nameOfCoreDataEntity = UsedInAppPets.nameOfCoreDataEntity
        //        StorageManager.deleteAllData(entityName: nameOfCoreDataEntity)
        //        XCTAssertFalse((UsedInAppPets.getItems(predicate: nil)?.count)! > 0)

        //* StorageManager - prepare data
        var dataForObj = UsedInAppPets.Fields(activ: false,
                                              createTime: NSDate.getCurrentDate(),
                                              name: "Dog Sharik",
                                              updateTime: NSDate.getCurrentDate(),
                                              petDetails: nil,
                                              petsRemAppStack: nil)

        let petObject = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                        data: dataForObj,
                                                        saveData: true)
        currentCount += 1

        dataForObj.name = "Dog Tuzik"
        let petObject2 = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                         data: dataForObj,
                                                         saveData: true)
        currentCount += 1

        //chek count

        XCTAssertEqual(UsedInAppPets.getItems(predicate: nil)?.count, currentCount)

        //deleting  data
        //* StorageManager.deleteObject
        let petObject2Name = (petObject2 as! UsedInAppPets).name
        StorageManager.deleteObject(entityName: ourEntityName, object: petObject2!)

        currentCount -= 1
        XCTAssertEqual(UsedInAppPets.getItems(predicate: nil)?.count, currentCount)

        //try to find this item
        let predicate2 = NSPredicate(format: "name == %@", petObject2Name!)
        let allItems2 = UsedInAppPets.getItems(predicate: predicate2)
        XCTAssertFalse(allItems2?.count != 0)


        //* StorageManager.saveAllContext
        let mov = StorageManager.getManagedObjectContext(ourEntityName)
        dataForObj.name = "Dog Suzja2"
        _ = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                            data: dataForObj,
                                            saveData: false)

        StorageManager.saveContext(mo: mov)
        currentCount += 1
        XCTAssertEqual(UsedInAppPets.getItems(predicate: nil)?.count, currentCount)

        StorageManager.saveAllContext()
        let predicate4 = NSPredicate(format: "name == %@", dataForObj.name!)
        let allItems4 = UsedInAppPets.getItems(predicate: predicate4)
        XCTAssertFalse(allItems4?.count == 0)

        //* StorageManager.deleteAllData
        StorageManager.deleteAllData(entityName: nameOfCoreDataEntity)
        XCTAssertFalse((UsedInAppPets.getItems(predicate: nil)?.count)! > 0)
        
    }
    
}
