//
//  NSManagedObjects+CoreDataTests.swift
//  pets-feeding
//
//  Created by Nikolay Dementiev on 10.11.16.
//  Copyright © 2016 mc373. All rights reserved.
//

import XCTest
@testable import pets_feeding

class NSManagedObjects_CoreDataTests: XCTestCase {

    private let ourEntityName = GeneralPurpose.nameOfCoreDataModelPF
    private var dataStorageForTest:StorageManager?

    override func setUp() {
        super.setUp()
        
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
//        XCUIApplication().launch()
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.

        dataStorageForTest = StorageManager.getSharedStorageManager(ourEntityName)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testNSManagerObjeccts() {

        let initCount = UsedInAppPets.getItems(predicate: nil)?.count ?? 0

//        var dataForObj = UsedInAppPets.fields(activ: false,
//                                              createTime: NSDate.getCurrentDate(),
//                                              name: "Dog Sharik",
//                                              updateTime: NSDate.getCurrentDate(),
//                                              petDetails: nil,
//                                              petsRemAppStack: nil)
//        var dataForObj = FieldsOfUsedInAppPets.sharedInstance.setData(activ: false,
//                                                                   name: "Dog Sharik",
//                                                                   petDetails: nil,
//                                                                   petsRemAppStack: nil,
//                                                                   createTime: NSDate.getCurrentDate(),
//                                                                   updateTime: NSDate.getCurrentDate()) as Fields
        var dataForObj = UsedInAppPets.fields
        dataForObj["activ"]  = FieldType.asBool(false)
        dataForObj["createTime"] = FieldType.asNSDate(NSDate.getCurrentDate())
        dataForObj["name"] =  FieldType.asString("Dog Sharik")
        dataForObj["updateTime"] = FieldType.asNSDate(NSDate.getCurrentDate())
        dataForObj["petDetails"] = nil
        dataForObj["petsRemAppStack"] = nil

        let petObject = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                        data: dataForObj,
                                                        saveData: true)

//        dataForObj.name = "Dog Tuzik"
//        let petObject2 = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
//                                                         data: dataForObj,
//                                                         saveData: true)

        dataForObj.updateValue(FieldType.asString("Dog Pet'ka"), forKey: "name")//dataForObj.name = "Dog Pet'ka"
        let petObject3 = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                                         data: dataForObj,
                                                         saveData: true) as! UsedInAppPets
        dataForObj.updateValue(FieldType.asString("Dog Suzja"), forKey: "name")//dataForObj.name = "Dog Suzja"
        petObject3.rewriteItemWithParameters(storage: dataStorageForTest,
                                             data: dataForObj,
                                             saveData: true)
        XCTAssertEqual(petObject3.itemDesctiption(), "Pet name: '\(petObject3.name?.description)" +
            "', record is active: '\(petObject3.activ.description)" +
            "', last update time: '\(petObject3.updateTime?.description)'")

        //show all records
        XCTAssertEqual(UsedInAppPets.getItems(predicate: nil)?.count, initCount+2)

        dataStorageForTest?.deleteObject(object: petObject!)
        dataStorageForTest?.deleteObject(object: petObject3)
        XCTAssertEqual(UsedInAppPets.getItems(predicate: nil)?.count, initCount)

        
    }
    
}
