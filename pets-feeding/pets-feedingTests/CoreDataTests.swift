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

    private var dataStorageForTest:StorageManager?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStorageForTest = StorageManager.getSharedStorageManager(GeneralPurpose.nameOfCoreDataModelPF)
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

    func testCreareNewObject_UsedInAppPets() {

        let dataForObj = UsedInAppPets.Fields(activ: false,
                                              createTime: NSDate.getCurrentDate(),
                                              name: "Dog Sharik",
                                              updateTime: NSDate.getCurrentDate(),
                                              petDetails: nil,
                                              petsRemAppStack: nil)
        
        _ = UsedInAppPets.insertNewInstance(storage: dataStorageForTest,
                                        data: dataForObj,
                                        saveData: true)
        //dataStorageForTest!.saveContext()
    }
    
}
